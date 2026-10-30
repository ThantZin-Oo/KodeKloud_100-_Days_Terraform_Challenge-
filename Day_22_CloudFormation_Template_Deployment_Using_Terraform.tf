resource "aws_cloudformation_stack" "devops-stack" {
  name = "devops-stack"
  template_body = jsonencode({
    Resources = {
      myS3 = {
        Type = "AWS::S3::Bucket"
        Properties = {
          BucketName = "devops-bucket-37850585"
          VersioningConfiguration = {
            Status = "Enabled"
          }
          Tags = [
            {
              Key   = "Name"
              Value = "devops-bucket-37850585"
            }
          ]
        }
      }
    }
  })
}

data "aws_cloudformation_stack" "devops-stack-data" {
  depends_on = [aws_cloudformation_stack.devops-stack]
  name       = "devops-stack"
}

output "my-output-data" {
  value = [data.aws_cloudformation_stack.devops-stack-data.tags]
}

data "aws_s3_bucket" "my_bucket" {
  depends_on = [aws_cloudformation_stack.devops-stack]
  bucket     = "devops-bucket-37850585"
}

output "my_bucket_arn" {
  value = data.aws_s3_bucket.my_bucket.arn
}
 