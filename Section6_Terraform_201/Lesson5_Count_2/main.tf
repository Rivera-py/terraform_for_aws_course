provider "aws" {
    region = "eu-west-2"
}


module "db" {
    source = "./dbserver"
    server_names = ["mariadb", "mysql", "athene"]
}


output "private_ips" {
    value = module.db.ds_private_ip
}