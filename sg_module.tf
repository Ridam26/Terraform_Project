variable "vpcid" {
    type = string
    default = "vpc-a4fdc5dc"
  
}
variable "sg_name" {}

resource "aws_security_group" "sg_module_creation" {
  name        = "${var.sg_name}"
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
    Name = "Demo-sg-module-test"
  }
}
output "sg_id_output" {
    value = "${aws_security_group.sg_module_creation.id}"
  
}