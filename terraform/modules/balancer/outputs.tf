output "external_ip" {
  value = one(one(yandex_lb_network_load_balancer.balancer.listener).external_address_spec[*].address)
}

output "tg_id" {
  value = yandex_lb_target_group.target_group.id
}