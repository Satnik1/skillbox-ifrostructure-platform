data "yandex_vpc_network" "network" {
  name = "main-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name =  "${var.environment}-main-subnet"
  zone = "ru-central1-a"
  network_id = data.yandex_vpc_network.network.id
  v4_cidr_blocks = [var.cidr] 
}