locals {
  name = "iobuilders-nignx-server"
  tags = {
    Owner       = "ed"
    Environment = terraform.workspace
    CreatedOn   = "12 Junio 2021"
  }
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

module "nignx" {
  source             = "github.com/edreinoso/terraform_infrastructure_as_code/modules/compute/ec2"
  ami                = data.aws_ami.amazon-linux-2.id
  instance_type      = var.instance_type
  subnet_ids         = var.ec2_subnet
  security_group_ids = split(",", aws_security_group.nignx_sg.id)
  source_check       = var.source_check
  public_ip          = var.public_ip
  key_name           = var.keys
  tags               = local.tags
  # user_data          = # need to define    the userdata
}


resource "aws_security_group" "nignx_sg" {
  name        = "nignx_sg"
  description = "Security group to allow traffic from load balancer to nginx server"
  vpc_id      = var.vpc_id
  tags        = local.tags
}

resource "aws_security_group_rule" "nignx_http_alb_rule" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb_sg.id
  security_group_id        = aws_security_group.nignx_sg.id
  description              = "HTTP rule from the load balancer"
}

resource "aws_security_group_rule" "nignx_ssh_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = split(",", var.ips)
  security_group_id = aws_security_group.nignx_sg.id
  description       = "SSH rule from my local machine"
}

resource "aws_security_group_rule" "nignx_all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nignx_sg.id
}
