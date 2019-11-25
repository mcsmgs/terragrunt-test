
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {}
  required_version = ">= 0.12.0"
}

resource "aws_route53_record" "test-import" {
  zone_id = "aws_route53_zone.primary.zone_id"
  name    = "a"
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.lb.public_ip}"]
}
