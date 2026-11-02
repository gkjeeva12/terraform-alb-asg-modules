variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name prefix for resources"
  type        = string
  default     = "alb-asg-project"
}

variable "vpc_id" {
  description = "ID of an existing VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "At least two public subnet IDs in different Availability Zones"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID compatible with the Apache user-data script"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
