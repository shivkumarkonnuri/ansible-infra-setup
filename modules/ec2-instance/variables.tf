variable "instance_type" {
  description = "EC2 Instance type"
  default = "t3.micro"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 Instance will be launched"
  type = string
}

variable "security_group_ids" {
  description = "List of Security group ids to attach to an EC2 Instance"
  type = list(string)
}

variable "tags" {
  description = "Additional tags need to be applied to an EC2 Instance"
  default = {}
  type = map(string)
}

variable "key_name" {
  description = "Holds the name of the key"
  type = string
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 10
}

variable "ssh_key_path" {
  description = "Path to the SSH private key on the Ansible control node"
  type        = string
  default     = "~/keys/terra-key-ansible"
}

variable "instances" {

  description = "Map of instance names to AMI IDs, SSH users, and OS family"
  
  type = map(object({
    ami       = string
    user      = string
    os_family = string
    instance_type = string
  }))

}
