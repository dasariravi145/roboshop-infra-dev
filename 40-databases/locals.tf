locals {

     ommon_tags = {
          Project = var.project
          Environment = var.environment
          Terraform = true
     }

      ami_id = data.aws_ami.joindevops.id
      database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_id.value)[0]
      database_sg_id = data.aws_ssm_parameter.database_sg_id.value
      redis_sg_id = data.aws_ssm_parameter.redis_sg_id.values
      mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.values
      rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.values
      mysql_role_name = join("-", 
      [for name in ["${var.project}","${var.environment}","mysql"] : title(name)
      ])
      

}