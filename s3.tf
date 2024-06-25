# ## Buckets
# resource "aws_s3_bucket" "s3_bucket_n1" {
#     bucket = local.s3_bucket_n1
# }

# resource "aws_s3_bucket" "s3_bucket_n2" {
#   bucket = local.s3_bucket_n2
#   tags = {
#     Name        = "My bucket"
#   }
# }

# ## ACLs S3 SETs

# resource "aws_s3_bucket_acl" "s3_bucket_n2" {
#   depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_n2,
#                 aws_s3_bucket_public_access_block.s3_bucket_n2]
#   bucket = aws_s3_bucket.s3_bucket_n2.id
#   acl    = "public-read-write"
# }

# resource "aws_s3_bucket_ownership_controls" "s3_bucket_n2" {
#   bucket = aws_s3_bucket.s3_bucket_n2.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "s3_bucket_n2" {
#   bucket = aws_s3_bucket.s3_bucket_n2.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }