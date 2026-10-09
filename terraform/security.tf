resource "aws_security_group" "alb" {
  name_prefix = "${local.name}-alb-"
  description = "Internet ingress to public application load balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP demo traffic; use HTTPS and ACM before production"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Application target connections"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}

resource "aws_security_group" "app" {
  name_prefix = "${local.name}-app-"
  description = "Private application instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Only ALB may reach backend"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    description = "Outbound HTTPS for package/image download through NAT"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTP package metadata if required"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Application MySQL database"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.database.id]
  }
}

resource "aws_security_group" "database" {
  name_prefix = "${local.name}-db-"
  description = "Only private application tier can access MySQL"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "MySQL from application instances"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }
}
