resource "yandex_compute_instance" "sna-vm-2" {
  name        = "prometheus-vm-1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.my-ubuntu-2004-1.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sna-sn-1.id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/timeweb.pub")}"
    
  }
}
output "internal_ip_address_vm_prometheus" {
  value = yandex_compute_instance.sna-vm-2.network_interface.0.ip_address
}

output "external_ip_address_vm_prometheus" {
  value = yandex_compute_instance.sna-vm-2.network_interface.0.nat_ip_address
}