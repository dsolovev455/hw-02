###cloud vars
#variable "token" {
#  type        = string
#  description = "1230"
#}

variable "cloud_id" {
  type        = string
  description = "b1gnea65n4qcsac8i3td"
}

variable "folder_id" {
  type        = string
  description = "b1gda72ev3btfpeud0sc"
}

variable "default_zone_web" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_web" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_web" {
  type        = string
  default     = "develop_web"
  description = "VPC network & subnet name"
}

variable "vpc_name_db" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}

###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBnWSF2E7JwGC5tAFvLzAS8uUgmxnEieWW5JmauAjCF1 denis@DenisHomeStation"
#  description = "~/.ssh/id_ed25519.pub"
#}

variable "vms_resources" {
type = map
default={
  web={
    cores="2"
    memory="1"
    core_fraction="5"
  },
  db={
    cores="2"
    memory="2"
    core_fraction="20"
  }
}
}

variable "metadata" {
type = map
default={
  web={
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBnWSF2E7JwGC5tAFvLzAS8uUgmxnEieWW5JmauAjCF1 denis@DenisHomeStation"
  },
  db={
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBnWSF2E7JwGC5tAFvLzAS8uUgmxnEieWW5JmauAjCF1 denis@DenisHomeStation"
  }
}
}
