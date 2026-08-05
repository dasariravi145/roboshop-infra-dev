resource "aws_route53_record" "mongodb" {

     zone_id = var.zone_id
     name = var.domain_name
     type = "A"
     ttl = "1"
     records = [aws_insatnce.mongodb.private_ip]
     allow_overwrite = true
}


resource "aws_route53_record" "redis" {

     zone_id = var.zone_id
     name = var.domain_name
     type = "A"
     ttl = "1"
     records = [aws_insatnce.redis.private_ip]
     allow_overwrite = true
}

resource "aws_route53_record" "mysql" {

     zone_id = var.zone_id
     name = var.domain_name
     type = "A"
     ttl = "1"
     records = [aws_insatnce.mysql.private_ip]
     allow_overwrite = true
}

resource "aws_route53_record" "rabbitmq" {

     zone_id = var.zone_id
     name = var.domain_name
     type = "A"
     ttl = "1"
     records = [aws_insatnce.rabbitmq.private_ip]
     allow_overwrite = true
}