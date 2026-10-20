# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-7f8dbb1434013cafc"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

resource "aws_ami_from_instance" "nautilus-ec2-ami" {
  name               = "nautilus-ec2-ami"
  source_instance_id = aws_instance.ec2.id
}

data "aws_ami" "nautilus_state" {
  depends_on = [aws_ami_from_instance.nautilus-ec2-ami]
  filter {
    name   = "Name"
    values = ["nautilus-ec2-ami"]
  }
}

output "ami_state" {
  value = data.aws_ami.nautilus_state.state
}