variable "AWS_REGIONS" {
  default = "eu-central-1"
}

variable "vpc_id" {
  type    = string
  default = "vpc-488bab23"
}

variable "ec2_subnet" {
  type    = string
  default = "subnet-582c2733"
}

variable "elb_subnet" {
  type    = string
  default = "subnet-582c2733,subnet-b9683df4,subnet-bf9adcc2"
}

variable "elb_name" {
  type    = string
  default = "iobuilders-alb"
}

variable "internal_elb" {
  type    = string
  default = "false"
}

variable "elb_type" {
  type    = string
  default = "application"
}

variable "tg_name" {
  type    = string
  default = "iobuilders-tg-nignx"
}

variable "port" {
  type    = string
  default = "8080"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "tg_deregister" {
  type    = string
  default = "400"
}

variable "bucket_name" {
  type    = string
  default = "iobuilders-alb-logs-bucket"
}

variable "acl" {
  type    = string
  default = "private"
}

variable "destroy" {
  type    = string
  default = "true"
}

variable "elb_acct_id" {
  type    = string
  default = "054676820928"
}

variable "ami" {
  type    = string
  default = "ami-07df274a488ca9195"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type"
}

variable "source_check" {
  type        = string
  default     = "false"
  description = "Instance source check"
}

variable "public_ip" {
  type        = string
  default     = "true"
  description = "Instance public ip"
}

variable "keys" {
  type        = string
  default     = "iobuilders"
  description = "Instance keys"
}

variable "ips" {
  type        = string
  default     = "213.127.72.237/32"
  description = "IPs allowed into the instance"
}
