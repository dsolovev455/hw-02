locals {
netology_web = "netology"
develop_web = "develop"
platform_web = "platform"
web_web = "web"
netology_db = "netology"
develop_db = "develop"
platform_db = "platform"
web_db = "db"
vm_web_name = "${ local.netology_web }-${ local.develop_web }-${ local.platform_web }-${ local.web_web }"
vm_db_name = "${ local.netology_db }-${ local.develop_db }-${ local.platform_db }-${ local.web_db }"
}
