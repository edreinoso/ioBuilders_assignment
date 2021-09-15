resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_ids
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_group_ids
  user_data                   = var.user_data
  iam_instance_profile        = var.instance_role
  associate_public_ip_address = var.public_ip
  source_dest_check           = var.source_check


  tags = var.tags

  volume_tags = var.tags

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
    }
  }
}
