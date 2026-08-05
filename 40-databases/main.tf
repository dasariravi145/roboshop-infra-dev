resource "aws_instace" "mongodb" {

       ami = local.ami_id
       instance_type = "t3.micro"
       subnet_id = local.database_subnet_id
       vpc_security_group_ids= [local.database_sg_id]
       

    tags = merge(
        {
              Name = "{var.project}-{var.environment}-mongodb"
        }, 
        local.common_tags
    )
}

resource "terraform_data" "bootstrap" {

        triggers_replace = [
             aws_insatce.mongodb.id
        ]
}

connection {

        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.aws_instance.mongodb.private_ip
}

provisioner "file" {
        source = "boostrap.sh"
        destination = "/tmp/boostrap.sh"
}

provisioner  "remote_exec" {
    
     inline =[

          "chmod +x /tmp/boostrap.sh"
          "sudo sh /tmp/boostrap.sh mysql ${var.environment}"
     ]
        
}


resource "aws_instace" "redis" {

       ami = local.ami_id
       instance_type = "t3.micro"
       subnet_id = local.database_subnet_id
       vpc_security_group_ids= [local.redis_sg_id]
       

    tags = merge(
        {
              Name = "{var.project}-{var.environment}-redis"
        }, 
        local.common_tags
    )
}

resource "terraform_data" "bootstrap_redis" {

        triggers_replace = [
             aws_insatce.redis.id
        ]
}

connection {

        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.aws_instance.redis.private_ip
}

provisioner "file" {
        source = "boostrap.sh"
        destination = "/tmp/boostrap.sh"
}

provisioner  "remote_exec" {
    
     inline =[

          "chmod +x /tmp/boostrap.sh"
          "sudo sh /tmp/boostrap.sh redis"
     ]
        
}


resource "aws_instace" "mysql" {

       ami = local.ami_id
       instance_type = "t3.micro"
       subnet_id = local.database_subnet_id
       vpc_security_group_ids= [local.mysql_sg_id]
       iam_instance_profile = aws_iam_instance_profile.mysql.name

    tags = merge(
        {
              Name = "{var.project}-{var.environment}-mysql"
        }, 
        local.common_tags
    )
}

resource "terraform_data" "mysql" {

        triggers_replace = [
             aws_insatce.mysql.id
        ]
}

connection {

        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.aws_instance.mysql.private_ip
}

provisioner "file" {
        source = "boostrap.sh"
        destination = "/tmp/boostrap.sh"
}

provisioner  "remote_exec" {
    
     inline =[

          "chmod +x /tmp/boostrap.sh"
          "sudo sh /tmp/boostrap.sh mysql dev"
     ]
        
}


resource "aws_instace" "rabbitmq" {

       ami = local.ami_id
       instance_type = "t3.micro"
       subnet_id = local.database_subnet_id
       vpc_security_group_ids= [local.rabbitmq_sg_id]
       iam_instance_profile = aws_iam_instance_profile.mysql.name

    tags = merge(
        {
              Name = "{var.project}-{var.environment}-rabbitmq"
        }, 
        local.common_tags
    )
}

resource "terraform_data" "rabbitmq" {

        triggers_replace = [
             aws_insatce.rabbitmq.id
        ]
}

connection {

        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.aws_instance.rabbitmq.private_ip
}

provisioner "file" {
        source = "boostrap.sh"
        destination = "/tmp/boostrap.sh"
}

provisioner  "remote_exec" {
    
     inline =[

          "chmod +x /tmp/boostrap.sh"
          "sudo sh /tmp/boostrap.sh rabbitmq dev"
     ]
        
}