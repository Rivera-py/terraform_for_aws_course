variable "instance_configs" {
    type = map
}


resource "aws_instance" "db01" {
    ami = var.instance_configs["ami"]
    instance_type = var.instance_configs["instance_type"]

    tags = {
        Name = var.instance_configs["db_name"]
    }
}


output "ds_private_ip" {
    value = aws_instance.db01.private_ip
}