resource "tls_private_key" "devops-created-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "devops-kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops-created-key.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.devops-created-key.private_key_pem
  filename        = "${path.module}/devops-kp-private_key"
  file_permission = "0400"
}
resource "aws_instance" "devops-ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"

  key_name = aws_key_pair.devops-kp.key_name

  tags = {
    Name = "devops-ec2"
  }
}