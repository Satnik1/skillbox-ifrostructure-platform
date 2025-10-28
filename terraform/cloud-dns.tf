resource "yandex_dns_zone" "sna_project_zone" {
  name        = "sna-zone"
  description = "test zone for project"

  zone    = "sna-project.fun."
  public  = true
}

resource "yandex_dns_recordset" "lb_record" {
  zone_id = yandex_dns_zone.sna_project_zone.id
  name = "sna-project.fun."
  type = "A"
  ttl = 60
  data = [one(one(yandex_lb_network_load_balancer.sna_project_balancer.listener).external_address_spec).address] #тут я вообще практически ничего не понимаю, строка несколько раз правилась ИИ. Пока не попался рабочий вариант. Можете в чате дать пояснение. Что, как тут работает?
} 
