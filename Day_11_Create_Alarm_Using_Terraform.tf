resource "aws_cloudwatch_metric_alarm" "xfusion-alarm" {
  alarm_name          = "xfusion-alarm"
  evaluation_periods  = 1
  period              = 300
  metric_name         = "CPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 80
  namespace           = "AWS/EC2"
  statistic           = "Average"
}