########################################################
# S3 Bucket
########################################################
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.domain
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
resource "aws_s3_bucket_object" "s3_bucket_object_1" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
  key    = "before_conversion/"
}
resource "aws_s3_bucket_object" "s3_bucket_object_2" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
  key    = "after_conversion/"
}

########################################################
# S3 Bucket Policy
########################################################
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.iam_policy.json
}
data "aws_iam_policy_document" "iam_policy" {
  statement {
    sid    = "Allow CloudFront"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
    actions = ["s3:GetObject"]
    resources = [
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}
