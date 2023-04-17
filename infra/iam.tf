resource "aws_iam_user" "emma" {
  name          = "emma"
  force_destroy = true
  tags          = {
    Name = "Emma"
  }
}

resource "aws_iam_user_login_profile" "emma_login_profile" {
  user                    = aws_iam_user.emma.name
  password_reset_required = true
}

resource "aws_iam_user" "liam" {
  name          = "liam"
  force_destroy = true
  tags          = {
    Name = "Liam"
  }
}

resource "aws_iam_user_login_profile" "liam_login_profile" {
  user                    = aws_iam_user.liam.name
  password_reset_required = true
}

resource "aws_iam_role" "admin" {
  name               = "Admin"
  max_session_duration = 3600

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = [
            aws_iam_user.emma.arn,
            aws_iam_user.liam.arn
          ]
        }
        Action    = "sts:AssumeRole"
        Condition = {
          Bool = {
            "aws:MultiFactorAuthPresent" : true
          }
        }
      }
    ]
  })

  tags = {
    Name = "Admin Role"
  }
}

data "aws_iam_policy" "admin_policy" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "admin_policy_attachment" {
  policy_arn = data.aws_iam_policy.admin_policy.arn
  role       = aws_iam_role.admin.name
}

resource "aws_iam_user" "fake_product" {
  name = "fake-product"
  path = "/system/"
  tags = {
    Name = "Fake Product"
  }
}

resource "aws_iam_user_policy_attachment" "fake_product_s3_access_attachment" {
  user       = aws_iam_user.fake_product.name
  policy_arn = aws_iam_policy.fake_product_assets_policy_rw.arn
}
