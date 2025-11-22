resource "yandex_lb_target_group" "target_group" {
  name = "${var.environment}-tg"  
  dynamic "target" {
    for_each = var.target_ips
    content {
      subnet_id = var.subnet_id
      address = target.value
    }
  }
}
resource "yandex_lb_network_load_balancer" "balancer" {
  name = "${var.environment}-lb"

  listener {
    name = "${var.environment}-listener"
    port = 8080
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id
    
    healthcheck {
      name = "http-healthcheck"
      http_options {
        port = 8080
        path = "/"
      }
    }
  }
}