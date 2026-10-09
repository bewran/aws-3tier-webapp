variable "aws_region" {
  description = "AWS region for the architecture."
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "container_image" {
  description = "Published Docker image URI for the backend API. Build and publish separately before deployment."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance class for the application tier; incurs AWS charges."
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS instance class; incurs AWS charges."
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  type    = string
  default = "appadmin"
}
