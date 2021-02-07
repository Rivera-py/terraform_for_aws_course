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


resource "aws_instance" "ec2" {
    ami = var.instance_config["ami_id"]
    instance_type = var.instance_config["instance_type"]
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}