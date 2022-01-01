resource "aws_iam_role" "media_convert_iam_role" {
  name               = "media-convert-iam-role"
  assume_role_policy = data.aws_iam_policy_document.media_convert_assume_role.json
}
data "aws_iam_policy_document" "media_convert_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["mediaconvert.amazonaws.com"]
    }
  }
}
resource "aws_iam_role_policy" "media_convert_iam_policy" {
  name   = "media-convert-iam-policy"
  role   = aws_iam_role.media_convert_iam_role.id
  policy = data.aws_iam_policy_document.media_convert_iam_policy.json
}
data "aws_iam_policy_document" "media_convert_iam_policy" {
  statement {
    effect = "Allow"
    # 今回はポリシーわけずに付与する
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}
