resource "aws_instance" "this" {
  for_each = var.instances

  ami = each.value.ami
  instance_type = each.value.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  
  key_name = var.key_name
  tags = merge(
    { Name = each.key 
      OSFamily = each.value.os_family
    },
    var.tags
  )
}
