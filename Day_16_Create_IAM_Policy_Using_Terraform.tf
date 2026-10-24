data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:describe*"]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "iampolicy_john" {
  name        = "iampolicy_john"
  policy      = data.aws_iam_policy_document.policy.json
  description = "EC2 policy"
}