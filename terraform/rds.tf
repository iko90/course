resource "aws_db_instance" "exzample-rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "exzample"
  skip_final_snapshot  = true
  publicly_accessible  = true
  username             = "admin"
  password             = "hools113579"
  parameter_group_name = "default.mysql5.7"

  tags = {
    "Name" = "exzample-rds"
  }
}
