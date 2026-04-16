# Groups instances by OS family, then passes each group to the template.
# The template just loops and prints — no filtering logic needed there.

locals {
  inventory = module.ec2_instances.instances

  ubuntu_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "ubuntu" }
  centos_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "centos" }
  amazon_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "amazon" }
  master_hosts = { for name, inst in local.inventory : name => inst if can(regex("master", name)) }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    ssh_key_path = var.ssh_key_path
    ubuntu       = local.ubuntu_hosts
    centos       = local.centos_hosts
    amazon       = local.amazon_hosts
    master       = local.master_hosts
  })

  filename        = "${path.module}/../inventories/dev/hosts.ini"
  file_permission = "0644"
}
