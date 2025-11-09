terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token=var.token
  cloud_id=var.cloud_id
  folder_id=var.folder_id
  zone      = "ru-central1-a"
}

data "yandex_compute_image" "my-ubuntu-2004-1" {
  family = "ubuntu-2004-lts"
}

resource "yandex_vpc_network" "sna-nw-1" {
  name = "sna-nw-1"
}

resource "yandex_vpc_subnet" "sna-sn-1" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.sna-nw-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

