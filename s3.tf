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

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# resource "aws_s3_object" "s3_object_tarro_files" {
#   for_each = fileset("./Studio-develop/","**")
#   bucket = aws_s3_bucket.s3_bucket_n2.id
#   key = "Studio-develop/${each.value}"
#   source = "./Studio-develop/${each.value}"
#   etag = filemd5("./Studio-develop/${each.value}")
# }

# resource "aws_s3_object" "s3_object_tarro_files2" {
#   for_each = fileset("./upload/","**")
#   bucket = aws_s3_bucket.s3_bucket_n2.id
#   key = "upload/${each.value}"
#   source = "./upload/${each.value}"
#   etag = filemd5("./upload/${each.value}")
# }