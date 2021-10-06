resource "aws_instance" "linux-instance" {
  ami           = "ami-06ec8443c2a35b0ba"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.exzample-subnet-public-1.id

  vpc_security_group_ids = [aws_security_group.exzample-all.id]

  key_name = "lesson6"

  tags = {
    "Name" = "linux-instance"
  }

  depends_on = [
    aws_db_instance.exzample-rds,
  ]
}