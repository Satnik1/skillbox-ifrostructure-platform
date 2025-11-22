resource "yandex_dns_zone" "main" {
  name = "main-cloud"
  description = "zone for project"
  zone    = "sna-project.fun."
  public  = true
}

resource "yandex_vpc_network" "network" {
  name = "main-network"
}