resource "aws_db_subnet_group" "main" {
  name       = "aws-3tier-demo-db-subnets"
  subnet_ids = aws_subnet.database[*].id
}

# Not application-wired yet: DB endpoint and Secrets Manager retrieval must be
# integrated securely into Node.js before claiming end-to-end database functionality.
resource "aws_db_instance" "mysql" {
  identifier                  = "aws-3tier-demo-mysql"
  engine                      = "mysql"
  instance_class              = var.db_instance_class
  allocated_storage           = 20
  storage_type                = "gp3"
  storage_encrypted           = true
  db_name                     = "appdb"
  username                    = var.db_username
  manage_master_user_password = true
  db_subnet_group_name        = aws_db_subnet_group.main.name
  vpc_security_group_ids      = [aws_security_group.database.id]
  publicly_accessible         = false
  multi_az                    = false
  deletion_protection         = true
  skip_final_snapshot         = false
  final_snapshot_identifier   = "aws-3tier-demo-final-snapshot"
}
