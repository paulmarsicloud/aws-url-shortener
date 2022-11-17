data "aws_route53_zone" "domain_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "public_zone_record" {
  zone_id = data.aws_route53_zone.domain_zone.zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = aws_s3_bucket.public_bucket.website_domain
    zone_id                = aws_s3_bucket.public_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
