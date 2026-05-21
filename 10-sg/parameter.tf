resource "aws_ssm_parameter" "sg_id" {

      count = length(var.sg_name)
      name = "/${var.project}/${var.environment}/${var.sg_names[count.index]}_sg_id"
      type = "String"
      value = module.sg[count.index].sg_id
}