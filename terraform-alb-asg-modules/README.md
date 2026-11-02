# Terraform ALB and ASG Modules

This project demonstrates reusable Terraform modules for an AWS Application Load Balancer (ALB) and Auto Scaling Group (ASG).

## Architecture

Internet users -> Application Load Balancer -> Target Group -> EC2 instances managed by an Auto Scaling Group.

- `modules/alb`: creates an internet-facing ALB, HTTP listener, target group, and ALB security group.
- `modules/asg`: creates an EC2 security group, launch template, and Auto Scaling Group.
- Root Terraform files: configure the AWS provider and connect the modules.
- `.github/workflows/terraform.yml`: runs formatting and validation checks on pushes and pull requests.

## Prerequisites

- Terraform 1.5 or later
- AWS CLI and credentials, if you intend to create a deployment
- An existing VPC
- At least two public subnets in different Availability Zones for the ALB
- Private subnets for the EC2 instances
- A compatible Linux AMI ID

The public subnets must have a route to an Internet Gateway. The private instances need outbound access to install Apache (for example, through NAT), or use an AMI that already contains Apache.

## Configure

Copy the example variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and replace all placeholder VPC, subnet, and AMI IDs with valid values from your AWS account.

Do not commit `terraform.tfvars`, credentials, or Terraform state files.

## Validate without deploying

```bash
terraform fmt -recursive
terraform init -backend=false
terraform validate
```

To create a deployment plan, configure valid values and AWS credentials, then run:

```bash
terraform plan
```

Do not run `terraform apply` unless you have reviewed the plan and understand the AWS charges. An ALB and supporting networking resources can incur ongoing costs.

## GitHub

Create a GitHub repository, then:

```bash
git init
git add .
git commit -m "Add modular Terraform code for ALB and ASG"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/terraform-alb-asg-modules.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.
