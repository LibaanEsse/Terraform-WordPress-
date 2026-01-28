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

The infrastructure is organised using dedicated Terraform modules, with each module responsible for a specific layer of the stack:

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

- Updates system packages

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
You have to do this from the Root Directory.

## 2. Initalise Terraform
```bash
terraform init
```
Make sure you you run this command after creating your providers.tf file.

### 3. Review & Apply Infrastructure

```bash
terraform plan
terraform apply
```
## Verification

After deployment:

- Navigating to the EC2 instance’s public IP address in a web browser loads the WordPress installation page
- WordPress is accessible over HTTP via port 80

 ## Assignment Images 
 You can view all project images which includes a detailed step by step tutorial here: [View all images](https://github.com/LibaanEsse/Terraform-WordPress-/tree/main/Images)

## Key Concepts Demonstrated
- Infrastructure as Code using Terraform
- AWS EC2 and networking fundamentals
- Terraform module design and reuse
- Dynamic security group configuration
- Automated instance bootstrapping using user data
- Debugging and resolving real-world infrastructure issues

## Challanges ##
- Debugging user data scripts that run only on first boot

- Correctly configuring security groups to allow HTTP and SSH access

- Passing outputs and variables between Terraform modules

- Fixing WordPress file ownership and permission issues

- Defining and managing variable default values after terraform

# Assignment 2 – EC2 Deployment Using Cloud-Init 
Thw goa; of this assignment is to demonstrate the use of Terraform and cloud-init to directly provision AWS infrastructure and automate EC2 instance configuration at boot time through Infrastructure as Code. All infrastructure in this assignment was provisioned and managed entirely using Terraform, with no manual configuration performed through the AWS Management Console.
The assignment also demonstrates Terraform’s integration with cloud-init to automate EC2 instance configuration during the initial boot process.

The deployment includes:
- An EC2 instance provisioned via Terraform
- Security groups
- A cloud-init configuration to install and configure software
- A working public endpoint
- All resources provisioned via Terraform

## What was Built ##

### Terraform Module based Infrastructure 
This deployment consists of the following components, all provisioned using the same reusable Terraform modules:

 **VPC module**
  - VPC
  - Subnet
  - Internet Gateway
  - Route table and route table association

 **EC2 module**
  - Security group with dynamic ingress and egress rules
  - SSH key pair association
  - EC2 instance
By leveraging the same Terraform modules, the deployment follows a standardised structure, reduces code duplication, and simplifies future updates or extensions. This approach also reflects real-world Infrastructure as Code best practices, where reusable modules enable faster and more reliable infrastructure provisioning across multiple environments.

A **cloud-init YAML configuration file**

During the instance’s first boot, cloud-init automatically:

* Updates system packages
* Installs the required software
* Configures and enables necessary services
* Ensures the instance is fully configured before it becomes available

Unlike a traditional shell-based user data script, cloud-init offers a declarative and structured approach to instance configuration, making deployments more predictable, maintainable, and easier to manage.

## How to Deploy
```bash
Cd Assignment -2
```
You have to do this from the Root Directory.

## 2. Initalise Terraform
```bash
terraform init
```
Terraform needs to download the required provider plugins

### 3. Review & Apply Infrastructure

```bash
terraform plan
terraform apply
```
## Verification
After deployment:

- The EC2 instance is reachable via its public IP address
- Cloud-init completes successfully on first boot

Installed services are running automatically without manual setup
Terraform exposes outputs such as the EC2 instance’s public IP address, making it easy to access the deployed instance once provisioning is complete. These outputs remove the need to manually locate resources in the AWS Management Console and provide a simple way to confirm that the deployment was successful.

## Assignment Images 
 You can view all project images which includes a detailed step by step tutorial here: [View all images](https://github.com/LibaanEsse/Terraform-WordPress-/tree/main/assignment-2/images)  

 ## Key Concepts Demonstrated

- Infrastructure as Code using Terraform
- AWS EC2 and networking fundamentals
- Terraform module composition and reuse
- Instance bootstrapping using cloud-init
- Declarative configuration management
- Automated provisioning with zero manual intervention
- Understanding the difference between user-data scripts and cloud-init

## Challanges 
- Designing and reusing Terraform modules correctly

- Automating instance bootstrapping with cloud-init

- Automating configuration without manual steps

- Distinguishing between traditional user-data scripts and cloud-init
 




















