resource "aws_s3_bucket" "s3_bucket_n1" {
    bucket = local.s3_bucket_n1
}

resource "aws_s3_bucket" "s3_bucket_n2" {
  bucket = local.s3_bucket_n2
  acl = "public-read"
  tags = {
    Name        = "My bucket"
  }
}