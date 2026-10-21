resource "aws_s3_bucket" "xfusion" {
  bucket = "xfusion-s3-752675029"
}
 
resource "aws_s3_bucket_ownership_controls" "xfusion" {
  bucket = aws_s3_bucket.xfusion.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "xfusion" {
  depends_on = [aws_s3_bucket_ownership_controls.xfusion]
  bucket     = aws_s3_bucket.xfusion.id
  acl        = "private"
}