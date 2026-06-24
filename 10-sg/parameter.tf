resource "aws_ssm_parameter" "mongodb_sg_id" {

      count = length(var.sg_name)
      name = "/${var.project}/${var.environment}/mongodb_sg_id"
      type = "String"
      value = module.sg.sg_id
}