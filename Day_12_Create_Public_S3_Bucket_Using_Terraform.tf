resource "aws_s3_bucket" "xfusion" {
  bucket = "xfusion-s3-504833347"
  tags = {
    Name = "xfusion-s3-504833347"
  }
}

resource "aws_s3_bucket_ownership_controls" "xfusion" {
  bucket = aws_s3_bucket.xfusion.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "xfusion" {
  bucket                  = aws_s3_bucket.xfusion.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "xfusion" {
  depends_on = [
    aws_s3_bucket_ownership_controls.xfusion,
    aws_s3_bucket_public_access_block.xfusion
  ]

  bucket = aws_s3_bucket.xfusion.id
  acl    = "public-read"
}