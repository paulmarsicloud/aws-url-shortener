data "aws_route53_zone" "domain_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "public_zone_record" {
  zone_id = data.aws_route53_zone.domain_zone.zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.public_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.public_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "acm_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.acm_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.domain_zone.zone_id
}
