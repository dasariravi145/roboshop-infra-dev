data "aws_ami" "joindevops" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    # Added a trailing wildcard (*) to catch full names like Redhat-9-DevOps-Practice-v1
    values = ["Redhat-9-DevOps-Practice*"] 
  }

  filter {
    name   = "root-device-type"
    # Fixed from "abs" to "ebs"
    values = ["ebs"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "database_subnet_id" {

       name = "/${var.project}/${var.environment}/database_subnet_id"
}

data "aws_ssm_parameter" "database_sg_id" {

       name = "/${var.project}/${var.environment}/database_sg_id"
}


data "aws_ssm_parameter" "redis_sg_id" {

       name = "/${var.project}/${var.environment}/redis_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {

       name = "/${var.project}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {

       name = "/${var.project}/${var.environment}/rabbitmq_sg_id"
}