output "alb_dns_name" {
  description = "Public HTTP demo endpoint after an approved deployment."
  value       = aws_lb.web.dns_name
}

output "database_endpoint" {
  description = "Private database endpoint. Credentials are AWS-managed."
  value       = aws_db_instance.mysql.endpoint
}

output "application_subnet_ids" {
  value = aws_subnet.app[*].id
}
