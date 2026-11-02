output "target_group_arn" {
  description = "Target group ARN used by the ASG"
  value       = aws_lb_target_group.this.arn
}

output "alb_dns_name" {
  description = "Public DNS name of the ALB"
  value       = aws_lb.this.dns_name
}

output "alb_security_group_id" {
  description = "Security group ID attached to the ALB"
  value       = aws_security_group.alb.id
}
