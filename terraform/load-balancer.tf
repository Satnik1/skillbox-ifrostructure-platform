resource "yandex_lb_target_group" "sna_target_group" {
  name = "test-tg"
  target {
    subnet_id = yandex_vpc_subnet.sna-sn-1.id
    address   = yandex_compute_instance.sna-vm-1.network_interface.0.ip_address
  }
}

resource "yandex_lb_network_load_balancer" "sna_project_balancer" {
  name = "sna-balancer"

  listener {
    name = "test-listener"
    port = 8080
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.sna_target_group.id
    
    healthcheck {
      name = "http-healthcheck"
      http_options {
        port = 8080
        path = "/"
      }
    }
  }
}
