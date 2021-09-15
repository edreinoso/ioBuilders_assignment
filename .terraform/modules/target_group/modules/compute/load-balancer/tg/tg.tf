###### Target Groups #####
resource "aws_lb_target_group" "target-group" {
  name                 = var.elb_tg_name
  port                 = var.tg_port
  protocol             = var.tg_protocol
  target_type          = var.tg_target_type
  vpc_id               = var.vpc_id
  deregistration_delay = var.deregistration

  health_check {
    path     = var.path
    port     = var.tg_port
    protocol = var.tg_protocol
  }

  tags = var.tags
}
