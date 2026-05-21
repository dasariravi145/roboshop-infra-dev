module "sg"{

     source = "git::https://github.com/dasariravi145/terraform-aws-sg.git"
     project = "roboshop"
     environment = "dev"
     sg_name = replace(var.sg_name[count.index], "_","-")
     
}