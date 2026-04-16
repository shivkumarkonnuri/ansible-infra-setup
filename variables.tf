variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Project name used for tagging"
  type        = string
  default     = "terraweek"
}

variable "environment" {
  description = "Environment name used for tagging"
  type        = string
  default     = "dev"
}

variable "ssh_key_path" {
  description = "Path to SSH private key"
  type        = string
  default     = "~/keys/ansible-master-key"
}
