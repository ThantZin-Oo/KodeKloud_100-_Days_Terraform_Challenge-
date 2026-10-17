resource "aws_ebs_volume" "devops-volume" {
  availability_zone = "us-east-1a"
  type              = "gp3"
  size              = 2
  tags = {
    Name = "devops-volume"
  }
}