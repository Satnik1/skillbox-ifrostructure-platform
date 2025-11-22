data "yandex_dns_zone" "main" {
  name = "main-cloud"
}

resource "yandex_dns_recordset" "lb_record" {
  zone_id =  data.yandex_dns_zone.main.id
  name = "${var.environment}.sna-project.fun."
  type = "A"
  ttl = 3600
  data = [var.lb_external_ip]
} 
