provider "aws" {
    region = "eu-west-2"
}


variable "vpcname" {
    type    = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["Value0", "Value1"]
}

variable "mymap" {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
}

variable "inputname" {
    type = string
    description = "Please enter the name of the VPC you want to create."
}

#variable "inputversion" {  # Too many inputs.
#    type = string
#    description = "Please enter the version of Splunk running in this VPC: "
#}

variable "mytuple" {
    type = tuple([string, number, string])
    default = ["cat", 1, "dog"]
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "object_name"
        port = [22, 80, 443, 8000, 8089, 9997]
    }
}


resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = var.inputname
        varReceipt = var.mylist[0]
        varReceipt2 = var.mylist[1]
        varMapd = var.mymap["Key1"]
    }
}


output "vpcid" {
    value = aws_vpc.myvpc.id
}