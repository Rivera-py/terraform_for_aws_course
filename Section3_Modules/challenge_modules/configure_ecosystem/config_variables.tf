### Main control panel; set all parameters here ###

variable "region" {
    type = string
    default = "eu-west-2"
}

variable "ec2_instance_configs" {
    type = map
    default = {
        ami = "ami-0e80a462ede03e653"
        instance_type = "t2.micro"
        ws_name = "web01"
        db_name = "db01"
    }
}

variable "security_group_ports" {
    type = list(number)
    default = [80, 443]
}


output "region" {
    value = var.region
}

output "ec2_instance_configs" {
    value = var.ec2_instance_configs
}

output "security_group_ports" {
    value = var.security_group_ports
}