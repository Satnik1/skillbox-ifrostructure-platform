data "template_file" "inventory" {
  template = file("${path.module}/templates/dev_hosts.cfg")
  
  vars = {
    app_server_ip = module.app_vm.instance_ips[0]
    app_server_nat_ip = module.app_vm.external_ips[0]
    monitoring_server_ip = module.monitoring_vm.instance_ips[0]
    monitoring_server_nat_ip = module.monitoring_vm.external_ips[0]
  }
}

resource "local_file" "ansible_inventory" {
  filename = "../../../ansible/inventory/test_hosts"
  content  = data.template_file.inventory.rendered
}
