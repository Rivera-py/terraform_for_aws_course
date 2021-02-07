variable "instance_id" {
    type = string
}


resource "aws_eip" "elastic_ip" {
    instance = var.instance_id
}


output "public_ip" {
    value = aws_eip.elastic_ip.public_ip
}