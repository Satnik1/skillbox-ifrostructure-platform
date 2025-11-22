variable "vm_name" {
  description = "name of VM"
  type = string
}

variable "environment" {
  description = "test/prod"
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_count" {
  type = number
}

variable "vm_role" {
  type = string
}

