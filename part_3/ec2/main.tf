data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "ghost" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.ec2_subnet_id
  vpc_security_group_ids      = var.ec2_sg_ids
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -aG docker ec2-user

              docker run -d \
                --name ghost \
                -e url=http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):2368 \
                -e database__client=mysql \
                -e database__connection__host=${var.db_ip} \
                -e database__connection__user=${var.db_username} \
                -e database__connection__password=${var.db_password} \
                -e database__connection__database=${var.db_name} \
                -p 2368:2368 \
                ghost:5-alpine
              EOF

  tags = { 
    Name = "ghost-ec2" 
  }
}


output "ghost_public_ip" {
  value = aws_instance.ghost.public_ip
}