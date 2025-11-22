data "yandex_compute_image" "my-ubuntu-2004-1" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "cloud_vm" {
  count = var.vm_count
  name = "${var.vm_role}${var.vm_name}-${var.environment}-${count.index}"
  platform_id = "standard-v1"
  zone = "ru-central1-a"

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my-ubuntu-2004-1.id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/timeweb.pub")}"
    
  }
}


