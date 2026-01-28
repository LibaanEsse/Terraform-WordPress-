### Terraform-AWS-WordPress-and-EC2-CloudInit-Deployment ###

## Overview ##
This repository showcases hands-on learning and practical implementation of **AWS infrastructure using Terraform**, with an emphasis on real-world cloud architecture, automation, and Infrastructure as Code (IaC) best practices.
Each assignment is organised as a self-contained Terraform project, demonstrating progressively advanced concepts such as modular infrastructure design, automated EC2 bootstrapping, and configuration management using cloud-init. All AWS resources are provisioned entirely through Terraform, with no manual configuration performed in the AWS Management Console. 

## Assignment 1 – Deployment of AWS WordPress Using Terraform
The goal of this assignment is to deploy a fully operational **WordPress stack on AWS** using **Terraform**, demonstrating how Infrastructure as Code (IaC) can automate the provisioning and configuration of real cloud infrastructure from start to finish.

The deployment includes:
- An EC2 instance running WordPress
- Security groups
- User data to install and configure dependencies
- A working public endpoint
- All resources provisioned via Terraform

## What was Built ##

### Terraform Module based Infrastructure 

The infrastructure is organized using dedicated Terraform modules, with each module responsible for a specific layer of the stack:

- **VPC Module**
  - VPC
  - Subnets
  - Internet Gateway
  - Route tables and route table associations

- **EC2 Module**
  - Security group with dynamic ingress and egress rules
  - SSH key pair association
  - EC2 instance

Each module contains only the resources it manages, while shared values (such as VPC IDs or subnet IDs) are passed between modules using Terraform  outputs and input variables.  
The root Terraform configuration provides environment-specific values through **variables** and `terraform.tfvars`.
This modular structure enhances code organization, reusability, and overall clarity, making the infrastructure easier to maintain and extend.

## User Data & Instance Configuration

A **user data shell script** is passed to the EC2 instance using Terraform.

On first boot, the script automatically:

= Updates system packages

- Installs Apache, PHP, and required dependencies

- Enables and starts the Apache service

- Downloads and configures WordPress in /var/www/html

- Sets correct ownership and permissions for WordPress

- Restarts Apache to apply changes

 This ensures the EC2 instance is fully configured with WordPress without any manual intervention.

## How to Deploy
```bash
git clone https://github.com/LibaanEsse/terraform-wordpress.git
cd Terraform-Wordpress
```







