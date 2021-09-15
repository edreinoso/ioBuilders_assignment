
variable "elb_tg_name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "vpc_id" {
  type    = string
  default = ""
}

# Not necessary at the moment. It's more necessary at the
# target group association

variable "tg_port" {
  type    = string
  default = ""
}

variable "tg_protocol" {
  type    = string
  default = ""
}

variable "tg_target_type" {
  type    = string
  default = ""
}

variable "deregistration" {
  type    = string
  default = ""
}

## Health Checks

variable "path" {
  type    = string
  default = ""
}
