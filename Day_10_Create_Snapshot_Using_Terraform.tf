resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name = "nautilus-vol"
  }
}

resource "aws_ebs_snapshot" "nautilus-vol-ss" {
  volume_id   = aws_ebs_volume.k8s_volume.id
  description = "Nautilus Snapshot"
  depends_on  = [aws_ebs_volume.k8s_volume]
  tags = {
    Name = "nautilus-vol-ss"
  }
}

data "aws_ebs_snapshot" "snapshot_check" {
  snapshot_ids = [aws_ebs_snapshot.nautilus-vol-ss.id]
}

output "snapshot_status" {
  value = [data.aws_ebs_snapshot.snapshot_check.state]
}