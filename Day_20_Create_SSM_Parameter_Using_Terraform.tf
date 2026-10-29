resource "aws_ssm_parameter" "datacenter-ssm" {
  name  = "datacenter-ssm-parameter"
  type  = "String"
  value = "datacenter-value"
}

data "aws_ssm_parameter" "datacenter-ssm" {
  name       = "datacenter-ssm-parameter"
  depends_on = [aws_ssm_parameter.datacenter-ssm]
}

output "ssm-name" {
  value = data.aws_ssm_parameter.datacenter-ssm.name
}
output "ssm-value" {
  sensitive = true
  value     = data.aws_ssm_parameter.datacenter-ssm.value
}