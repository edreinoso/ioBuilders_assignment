resource "aws_lb" "elb" {
  name               = var.elb_name
  internal           = var.internal_elb
  load_balancer_type = var.elb_type
  security_groups    = var.security_group
  subnets            = var.subnet_ids

  access_logs {
    bucket  = var.bucket_name
    prefix  = ""
    enabled = true
  }

  tags = var.tags
}
