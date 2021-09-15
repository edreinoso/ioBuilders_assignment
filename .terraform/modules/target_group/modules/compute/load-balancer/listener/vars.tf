variable "listener_port" {
  type    = string
  default = ""
}

variable "listener_protocol" {
  type    = string
  default = ""
}

variable "elb_arn" {
  type    = string
  default = ""
}

variable "target_group_arn" {
  type    = string
  default = ""
}

variable "certificate_arn" {
  type    = string
  default = ""
}

variable "ssl_policy" {
  type    = string
  default = ""
}
