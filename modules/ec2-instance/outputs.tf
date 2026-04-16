output "instances" {
  value = {
    for name, inst in aws_instance.this :
    name => {
      public_ip = inst.public_ip
      os_family = inst.tags.OSFamily
      instance_id = inst.id
      public_dns = inst.public_dns
      private_ip = inst.private_ip
      
      user = (
        inst.tags["OSFamily"] == "ubuntu" ? "ubuntu" :
        "ec2-user"
      )
    }
  }
}
