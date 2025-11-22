variable "target_ips" {
  description = "IP address for each vm"
  type = list(string)
  default = []
}

variable "environment" {
  description = "test/prod"
  type = string
}

variable "subnet_id" {
  type = string
}

