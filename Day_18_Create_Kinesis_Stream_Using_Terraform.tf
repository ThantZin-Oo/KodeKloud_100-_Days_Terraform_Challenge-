resource "aws_kinesis_stream" "devops-stream" {
  name = "devops-stream"
  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}

data "aws_kinesis_stream" "stream" {
  depends_on = [aws_kinesis_stream.devops-stream]
  name       = "devops-stream"
}
output "stream_result" {
  value = data.aws_kinesis_stream.stream.status
}