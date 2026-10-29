resource "aws_cloudwatch_log_group" "xfusion-log-group" {
  name = "xfusion-log-group"

  tags = {
    Environment = "Dev"
  }
}

resource "aws_cloudwatch_log_stream" "xfusion-log-stream" {
  name           = "xfusion-log-stream"
  log_group_name = aws_cloudwatch_log_group.xfusion-log-group.name
}