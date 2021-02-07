provider "aws" {
    region = var.region
}


variable "region" {
    type = string
    default = "eu-west-2"
}

variable "instance_config" {
    type = map
    default = {
        "ami_id" = "ami-0e80a462ede03e653"
        instance_type = "t2.micro"
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


resource "aws_instance" "ec2" {
    ami = var.instance_config["ami_id"]
    instance_type = var.instance_config["instance_type"]
    security_groups = [aws_security_group.webtraffic.name]
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