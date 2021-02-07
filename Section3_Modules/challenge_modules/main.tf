### Challenge 3: Modularise (as much as possible) challenge 2. ###

provider "aws" {
    region = module.config.region
}


module "config" {
    source = "./configure_ecosystem"
}

module "webserver" {
    source = "./webserver"
    instance_configs = module.config.ec2_instance_configs
    security_group_name = module.security_groups.sg_name

}

module "dbserver" {
    source = "./dbserver"
    instance_configs = module.config.ec2_instance_configs
}

module "security_groups" {
    source = "./security_groups"
    ingress_rules = module.config.security_group_ports
    egress_rules = module.config.security_group_ports
}

module "elastic_ip" {
    source = "./elastic_ip"
    instance_id = module.webserver.instance_id
}


output "db_private_ip" {
    value = module.dbserver.ds_private_ip
}

output "ws_public_ip" {
    value = module.elastic_ip.public_ip
}