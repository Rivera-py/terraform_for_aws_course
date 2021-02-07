provider "aws" {
    region = "eu-west-2"
}


resource "aws_instance" "db" {
    ami = "ami-0e80a462ede03e653"
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-0e80a462ede03e653"
    instance_type = "t2.micro"

    depends_on = [aws_instance.db]
}


data "aws_instance" "dbsearch" {
    filter {
        name = "tag:Name"
        values = ["DB Server"]
    }
}


output "dbservers" {
    value = data.aws_instance.dbsearch.availability_zone
}