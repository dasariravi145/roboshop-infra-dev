module "sg"{

     source = "git::https://github.com/dasariravi145/terraform-aws-sg.git"
     project = "roboshop"
     environment = "dev"
     sg_name = replace(var.sg_names[count.index], "_","-")
     vpc_id = local.vpc_id
     
}