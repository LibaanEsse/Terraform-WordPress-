
output "web_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "web_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.web.public_dns
}

output "web_url" {
  description = "HTTP URL to access the web server"
  value       = "http://${aws_instance.web.public_ip}"
}

