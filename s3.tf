## Buckets
resource "aws_s3_bucket" "s3_bucket_n1" {
    bucket = local.s3_bucket_n1
}

resource "aws_s3_bucket" "s3_bucket_n2" {
  bucket = local.s3_bucket_n2
  tags = {
    Name        = "My bucket"
  }
}

## ACLs S3 SETs

resource "aws_s3_bucket_acl" "s3_bucket_n2" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_n2,
                aws_s3_bucket_public_access_block.s3_bucket_n2]
  bucket = aws_s3_bucket.s3_bucket_n2.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_n2" {
  bucket = aws_s3_bucket.s3_bucket_n2.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_n2" {
  bucket = aws_s3_bucket.s3_bucket_n2.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}