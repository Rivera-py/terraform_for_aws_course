# Terraform for AWS - Quick Examples
 
Example code from a Terraform for AWS Udemy course. This course introduced some basic concepts of Terraform, as well as introducing the use of Terraform to provision several different types of AWS resources with Terraform.

## *Prerequisites:*

+ An environment in which to install Terraform,
+ An AWS account,
+ AWS CLI set up,
+ *[Optional]* VS Code (with terraform plugin).

## Section 1 --- Terraform 101

This section goes over the core concepts of Terraform.

+ **Lesson 1 - First Resource:** Set up a simple VPC in AWS.
+ **Lesson 2 - Variables 101:** Syntax and different types of variables in TF.
+ **Challenge 1:** Applying variable knowledge to setting up a VPC.

## Section 2 --- EC2

Some basics of provisioning EC2 instances with Terraform.

+ **Lesson 1 - EC2:** Gather some info and set up a standard free tier EC2 instance.
+ **Lesson 2 - Elastic IP:** Set up an instance with a static public IP with Elastic IP.
+ **Lesson 3 - Security Groups:** Create some security groups and attach them to an instance.
+ **Lesson 4 - Dynamic:** Use Terraform's iteration to provision SGs with a list of ports you require.
+ **Challenge 2:** Set up two EC2 instances, one with EIP and output one instances static public IP and the other's private IP.

## Section 3 --- Modules

Learn about using Terraform modules to create reusable code and to use premade solutions.

+ **Lesson 1 - Modules 101:** Basics of using modules.
+ **Challenge 3:** Reproduce the resources in Challenge 2, but modularising each aspect.

## Section 4 --- IAM

Provision roles and users and attach roles to users with Terraform.

## Section 5 --- RDS

Provision a basic RDS instance with Terraform.

## Section 6 --- Terraform 201

Learn about some more advanced Terraform concepts.

+ **Lesson 1 - S3 Remote Backend:** Provision an S3 bucket with versioning enabled to be used as a remote backend for next lesson.
+ **Lesson 2 - Configure Remote Backend:** Use Terraform with an S3 bucket as a backend, rather than storing tf state locally.
+ **Lesson 3 - Dependencies:** Make the provisioning of one resource dependent on the completion of the provisioning of another.
+ **Lesson 4 - Count 1:** Use one TF resource to provision several identical AWS resources.
+ **Lesson 5 - Count 2:** Use length function to make count depend on the size of a list, and then use the elements of that list to tag resources by using `count.index`.
+ **Lesson 6 - Env Vars:** Call variables based on environment file you choose.
+ **Lesson 7 - Imports:** Take control of a resource that already exists in AWS.
+ **Lesson 8 - Data Sources:** Query data from resources provisioned by Terraform.
