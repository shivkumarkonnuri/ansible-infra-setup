output "instances" {
  value = {
    for name, inst in module.ec2_instances.instances :
    name => {
      public_ip = inst.public_ip
      os_family = inst.os_family
    }
  }
}
