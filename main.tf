provider "aws" {
  region = var.aws_region
}

##########################################################################
# Generate EC2 instances
##########################################################################
resource "aws_instance" "jenkins_master" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_security_group.id]

  tags = {
    Name = "${var.project_name}.${var.Master_Server_Name}"
  }
}

resource "aws_instance" "jenkins_slave" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_security_group.id]

  tags = {
    Name = "${var.project_name}.${var.Slave_Server_Name}"
  }
}

###############################################################################
# Create security group for Jenkins (Inbound & Outbound rules) in default VPC
###############################################################################
data "aws_vpc" "default" {
  default = true
}
resource "aws_security_group" "jenkins_security_group" {
  name        = "${var.project_name}.jenkins.security-group"
  description = "Security group for Jenkins instances"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }
}
