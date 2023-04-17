resource "aws_s3_bucket" "fake_product_assets" {
  bucket = "fake-product-assets"
}

resource "aws_iam_policy" "fake_product_assets_policy_rw" {
  name        = "fake-assets-policy"
  description = "Provides read and write access to fake-product-assets"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.fake_product_assets.arn}/*"
      }
    ]
  })
}