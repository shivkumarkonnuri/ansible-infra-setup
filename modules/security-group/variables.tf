variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type = string
}

variable "sg_name" {
  description = "Name of the security group"
  type = string
}

variable "ingress_ports" {
  description = "List of ports to allow inbound traffic"
  default = [22, 80, 443]
  type = list(number)
}

variable "tags" {
  description = "Additional tags to apply to Securiy Group"
  default = {}
  type = map(string)
}
