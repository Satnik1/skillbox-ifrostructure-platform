data "yandex_compute_instance" "sna-vm-1" {
  instance_id = yandex_compute_instance.sna-vm-1.id
}

data "yandex_compute_instance" "sna-vm-2" {
  instance_id = yandex_compute_instance.sna-vm-2.id
}

data "template_file" "inventory" {
  template = file("${path.module}/templates/dev_hosts.cfg")
  
  vars = {
    app_server_ip = data.yandex_compute_instance.sna-vm-1.network_interface.0.ip_address
    app_server_nat_ip = yandex_compute_instance.sna-vm-1.network_interface.0.nat_ip_address
    monitoring_server_ip = data.yandex_compute_instance.sna-vm-2.network_interface.0.ip_address
    monitoring_server_nat_ip = yandex_compute_instance.sna-vm-2.network_interface.0.nat_ip_address
  }

  depends_on = [
    yandex_compute_instance.sna-vm-1,
    yandex_compute_instance.sna-vm-2
  ]
}

resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory/hosts"
  content  = data.template_file.inventory.rendered
  
  depends_on = [data.template_file.inventory]
}
