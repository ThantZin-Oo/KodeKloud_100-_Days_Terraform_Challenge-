resource "aws_iam_user" "rose" {
  name = "iamuser_rose"
  tags = {
    Name = "iamuser_rose"
  }
}
 
resource "aws_iam_access_key" "rose" {
  user = aws_iam_user.rose.name
}
 
data "aws_iam_policy_document" "rose_policy" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}
 
 
resource "aws_iam_user_policy" "rose_policy" {
  name   = "rose_admin"
  user   = aws_iam_user.rose.name
  policy = data.aws_iam_policy_document.rose_policy.json
}