########################################################
# Route53 Record Set
########################################################
resource "aws_route53_record" "cloudfront_alias" {
  zone_id = var.host_zone_id
  name    = var.domain
  type    = "A"

  alias {
    evaluate_target_health = true
    name                   = aws_cloudfront_distribution.distribution.domain_name
    zone_id                = aws_cloudfront_distribution.distribution.hosted_zone_id
  }
}
