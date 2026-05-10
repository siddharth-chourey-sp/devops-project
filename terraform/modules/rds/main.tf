resource "aws_db_subnet_group" "rds" {
    name = "db-subnet-group"
    subnet_ids = var.db_subnet_ids

    tags = {
        Name = "db-subnet-group"
}
}

resource "aws_db_instance" "rds" {
    identifier = "webapp-db-instance"

    
    allocated_storage = 5
    storage_type = "gp2"

    engine = "mysql"
    instance_class = "db.t3.micro"
    engine_version = "8.0"
    

    db_name = var.db_name
    username = var.db_username
    password = var.db_password

    db_subnet_group_name = aws_db_subnet_group.rds.name
    vpc_security_group_ids = [var.db_sg_id]
    
    publicly_accessible = false
    multi_az = true
    
    storage_encrypted = true

    backup_retention_period = 0

    skip_final_snapshot = true
    deletion_protection = false

    tags = {
        Name = "my-db-instance"
    }
}
