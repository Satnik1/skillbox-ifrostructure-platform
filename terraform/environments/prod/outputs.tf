output "app_prod_internal_ip_address_vm" {
  value = module.app_vm.instance_ips
}

output "app_prod_external_ip_address_vm" {
  value = module.app_vm.external_ips
}

output "prod_instance_names" {
  value = module.app_vm.instance_names
}

output "mon_prod_internal_ip_address_vm" {
  value = module.monitoring_vm.instance_ips
}

output "mon_prod_external_ip_address_vm" {
  value = module.monitoring_vm.external_ips
}

output "mon_prod_instance_names" {
  value = module.monitoring_vm.instance_names
}