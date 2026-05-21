variable "project" {

     default = "roboshop"
}

variable "environment" {

      default = "dev"
}

variable "sg_names" {

     type = list
     default = [
           #database
           "mongodb","redis","mysql","rabbitmq",
           #backend
           "catalogue","user","cart","shipping","payment",
           #Backend ALB
           "backend_alb",
           #Frontend
           "frontend",
           #Frontend_alb
           "frontend_alb",
           #Bastion
           "bastion",
           #openvpn
           "openvpn"
     ]
}