provider "aws" {
  region = "us-east-1"
}

resource "aws_ami_from_instance" "default" {
  name                    = "teste-ami"
  source_instance_id      = "i-0faf9dfe53b0b6537"
  snapshot_without_reboot = "true"

  lifecycle {
    create_before_destroy = true
  }
}

