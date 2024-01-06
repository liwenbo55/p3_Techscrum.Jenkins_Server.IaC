variable "aws_region" {
  description = "aws_region"
  type        = string
}

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "ami" {
  description = "AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the instance. "
  type        = string
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance. Key pair should be created before run terraform."
  type        = string
}

variable "Master_Server_Name" {
  description = "Name of the EC2 for Jenkins Master."
  type        = string
}

variable "Slave_Server_Name" {
  description = "Name of the EC2 for Jenkins slave."
  type        = string
}
