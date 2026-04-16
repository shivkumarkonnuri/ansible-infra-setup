locals {
  common_tags = {
    Project = var.project_name
    Environment = var.environment
    ManagedBy = "Terraform"
  }

  instances = {
    "control-node-ubuntu" = {
      ami           = data.aws_ami.ubuntu.id
      user          = "ubuntu"
      os_family     = "ubuntu"
      instance_type = "t3.micro"
    }

    "worker-ubuntu" = {
      ami           = data.aws_ami.ubuntu.id
      user          = "ubuntu"
      os_family     = "ubuntu"
      instance_type = "t3.micro"
    }

    "worker-centos" = {
      ami           = data.aws_ami.centos.id
      user          = "ec2-user"
      os_family     = "centos"
      instance_type = "t3.micro"
    }

    "worker-amazon" = {
      ami           = data.aws_ami.amazon.id
      user          = "ec2-user"
      os_family     = "amazon"
      instance_type = "t3.micro"
    }
  }
}
