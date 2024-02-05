resource "yandex_vpc_network" "develop_vpc_web" {
  name = var.vpc_name_web
}
resource "yandex_vpc_subnet" "develop_sub_web" {
  name           = var.vpc_name_web
  zone           = var.default_zone_web
  network_id     = yandex_vpc_network.develop_vpc_web.id
  v4_cidr_blocks = var.default_cidr_web
}

resource "yandex_vpc_network" "develop_vpc_db" {
  name = var.vpc_name_db
}
resource "yandex_vpc_subnet" "develop_sub_db" {
  name           = var.vpc_name_db
  zone           = var.default_zone_db
  network_id     = yandex_vpc_network.develop_vpc_db.id
  v4_cidr_blocks = var.default_cidr_db
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_name
  zone        = var.default_zone_web
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources.web["cores"]
    memory        = var.vms_resources.web["memory"]
    core_fraction = var.vms_resources.web["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_sub_web.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.web["serial-port-enable"]
    ssh-keys           = var.metadata.web["ssh-keys"]
  }

}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  zone        = var.default_zone_db
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vms_resources.db["cores"]
    memory        = var.vms_resources.db["memory"]
    core_fraction = var.vms_resources.db["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_sub_db.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata.db["serial-port-enable"]
    ssh-keys           = var.metadata.db["ssh-keys"]
  }

}
