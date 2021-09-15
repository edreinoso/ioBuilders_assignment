variable "elb_name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "elb_type" {
  type    = string
  default = ""
}

variable "internal_elb" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = list(any)
  default = []
}

variable "security_group" {
  type    = list(any)
  default = []
}

variable "bucket_name" {
  type    = string
  default = ""
}
