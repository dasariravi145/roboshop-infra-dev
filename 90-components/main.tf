module "component" {
        for_each = var.components
        source = "https://github.com/dasariravi145/terraform-roboshop-component.git"
        component = each.key
        rule_priority = each.value.rule_priority
}