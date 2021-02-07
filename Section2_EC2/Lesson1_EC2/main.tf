provider "aws" {
    region = var.region
}


variable "region" {
    type = string
    default = "eu-west-2"
}


resource "aws_instance" "ec2" {
    ami = "ami-0e80a462ede03e653"
    instance_type = "t2.micro"
}