resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "ghost-db-subnet-group"
  subnet_ids = var.rds_subnet_ids
}

resource "aws_db_instance" "ghost_db" {
  identifier             = var.db_identifier
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  skip_final_snapshot    = true
  vpc_security_group_ids = var.rds_sg_ids
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible    = false
}

