provider "aws" {
    region = var.region
}


variable "region" {
    type = string
    default = "eu-west-2"
}

variable "instance_configs" {
    type = map
    default = {
        ami_id = "ami-0e80a462ede03e653"
        instance_type = "t2.micro"
        ws_name = "webserver01"
        db_name = "DB Server"
    }
}

variable "ingress_rules" {
    type = list(number)
    default = [80, 443]
}

variable "egress_rules" {
    type = list(number)
    default = [80, 443, 25, 3306, 53]
}


resource "aws_instance" "web01" {
    ami = var.instance_configs["ami_id"]
    instance_type = var.instance_configs["instance_type"]
    security_groups = [aws_security_group.webtraffic.name]
    user_data = file("bootstrap.sh")

    tags = {
        Name = var.instance_configs["ws_name"]
    }
}

resource "aws_instance" "db01" {
    ami = var.instance_configs["ami_id"]
    instance_type = var.instance_configs["instance_type"]

    tags = {
        Name = var.instance_configs["db_name"]
    }
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress_rules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egress_rules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

resource "aws_eip" "elastic_ip" {
    instance = aws_instance.web01.id
}


output "private_db_ip" {
    value = aws_instance.db01.private_ip
}

output "elastic_ws_ip" {
    value = aws_eip.elastic_ip.public_ip
}