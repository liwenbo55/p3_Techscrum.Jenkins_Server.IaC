project_name       = "TechScrum"

aws_region         = "ap-southeast-2"

Master_Server_Name = "Jenkins Master"

Slave_Server_Name  = "Jenkins Slave"

# AMI to use for the instance.
ami                = "ami-04f5097681773b989"

# Instance type to use for the instance. 
instance_type      = "t2.micro"

# Name of the Key Pair to use for the instance. Key pair should be created before run terraform.
key_name           = "jenkins-vm"
