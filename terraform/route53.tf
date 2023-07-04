data "aws_route53_zone" "domain_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "public_zone_record" {
  zone_id = data.aws_route53_zone.domain_zone.zone_id
  name    = var.environment
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.cloudfront_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
