variable instance_configs {
    type = map
}

variable security_group_name {
    type = string
}


resource "aws_instance" "web01" {
    ami = var.instance_configs["ami"]
    instance_type = var.instance_configs["instance_type"]
    security_groups = [var.security_group_name]
    user_data = file("webserver/bootstrap.sh")

    tags = {
        Name = var.instance_configs["ws_name"]
    }
}


output "instance_id" {
    value = aws_instance.web01.id
}