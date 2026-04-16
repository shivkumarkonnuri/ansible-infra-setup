data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
}

data "aws_ami" "amazon" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["125523088429"]
  filter {
    name   = "name"
    values = ["CentOS Stream 9*x86_64*"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
