variable "ami" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "ec2_name" {
  type    = string
  default = ""
}

variable "template" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = string
  default = ""
}

variable "user_data" {
  type    = string
  default = ""
}

variable "user_data_base64" {
  type    = string
  default = ""
}

variable "key_name" {
  type    = string
  default = ""
}

variable "public_ip" {
  type    = string
  default = ""
}

variable "source_check" {
  type    = string
  default = ""
}

variable "security_group_ids" {
  type    = list(any)
  default = []
}

variable "instance_role" {
  type    = string
  default = ""
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  type    = map(any)
  default = {}
}
