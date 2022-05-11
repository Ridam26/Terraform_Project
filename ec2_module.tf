
/*variable "vpcid" {
    type = string
    default = "vpc-a4fdc5dc"
  
}
resource "aws_security_group" "terraform_ec2_sg_module_input" {
  name        = "terraform_ec2_sg_module_input"
  description = "terraform course security group for ec2"
  vpc_id      = "${var.vpcid}"

  ingress {
    //description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    //ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  ingress {
    //description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    //ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   // ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Demo-sg-module"
  }
}*/

variable "amiid" {
    default = "ami-012363a297a261d65"
  
}

variable "sg_id" {}
variable "ec2_name" {}
resource "aws_instance" "Test_terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "demokey"
  user_data = <<-EOF
  #! /bin/bash
  sudo yum update -y
  sudo yum install -y httpd
  sudo systemctl start httpd
  echo "<h1>Sample Webserver creating using terraform using module creation as input<br>Apache done by Ridam Kundu</h1>" >>  /var/www/html/index.html
  EOF
  vpc_security_group_ids = ["${var.sg_id}"]

  tags = {
    Name = "${var.ec2_name}"
  }
}
