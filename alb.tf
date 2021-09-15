module "alb" {
  source         = "github.com/edreinoso/terraform_infrastructure_as_code/modules/compute/load-balancer/elb"
  elb_name       = var.elb_name
  internal_elb   = var.internal_elb
  elb_type       = var.elb_type
  security_group = split(",", aws_security_group.alb_sg.id)
  subnet_ids     = split(",", var.elb_subnet)
  bucket_name    = var.bucket_name
  tags           = local.tags
}

resource "aws_s3_bucket" "alb_s3_logs" {
  bucket        = var.bucket_name
  acl           = var.acl
  force_destroy = var.destroy

  policy = <<POLICY
{
  "Id": "Policy1566872708101",
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "Stmt1566872706748",
          "Action": [
              "s3:PutObject"
          ],
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::${var.bucket_name}/AWSLogs/130193131803/*",
          "Principal": {
              "AWS": [
                  "${var.elb_acct_id}"
              ]
          }
      }
  ]
}
POLICY

  tags = local.tags
}

module "target_group" {
  source         = "github.com/edreinoso/terraform_infrastructure_as_code/modules/compute/load-balancer/tg"
  vpc_id         = var.vpc_id
  elb_tg_name    = var.tg_name
  tg_port        = var.port
  tg_protocol    = var.protocol
  tg_target_type = var.target_type
  deregistration = var.tg_deregister
  tags           = local.tags
}

## Attachment ##
module "attachment" {
  source           = "github.com/edreinoso/terraform_infrastructure_as_code/modules/compute/load-balancer/tgAttachment"
  target_group_arn = module.target_group.target-arn
  tg_id            = module.nignx.ec2-id
  port             = var.port
}

module "http_listener" {
  source            = "github.com/edreinoso/terraform_infrastructure_as_code/modules/compute/load-balancer/listener"
  elb_arn           = module.alb.elb-arn
  target_group_arn  = module.target_group.target-arn
  listener_port     = "80"
  listener_protocol = var.protocol
}

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Security group to allow HTTP traffict to the nginx instance"
  vpc_id      = var.vpc_id
  tags        = local.tags
}

resource "aws_security_group_rule" "alb_http_rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
  description       = "Rule to allow HTTP traffic"
}
