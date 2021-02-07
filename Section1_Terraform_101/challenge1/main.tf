provider "aws" {
    region = var.region
}


variable "region" {
    type = string
    default = "eu-west-2"
}

variable "vpc_name" {
    type = string
    default = "TerraformVPC"
}

variable "cidr" {
    type = string
    default = "192.168.0.0/24"
}


resource "aws_vpc" "tf_vpc" {
    cidr_block = var.cidr

    tags = {
        Name = var.vpc_name
    }
}


output "vpc_id" {
    value = aws_vpc.tf_vpc.id
}