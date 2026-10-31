resource "aws_opensearch_domain" "xfusion-es" {
  domain_name = "xfusion-es"
}

data "aws_opensearch_domain" "my_domain" {
  depends_on  = [aws_opensearch_domain.xfusion-es]
  domain_name = "xfusion-es"
}

output "my_domain_status" {
  value = data.aws_opensearch_domain.my_domain.created
}