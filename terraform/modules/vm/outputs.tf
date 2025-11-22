output "instance_ips" {
  value = yandex_compute_instance.cloud_vm[*].network_interface[0].ip_address
}

output "external_ips" {
  value = yandex_compute_instance.cloud_vm[*].network_interface[0].nat_ip_address
}

output "instance_names" {
  value = yandex_compute_instance.cloud_vm[*].name
}
