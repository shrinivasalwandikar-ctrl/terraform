resource "aws_s3_bucket" "shrini_backend_bucket" {
    bucket = "shrini-backend-bucket-versioned-sse-bucket"

}

resource "aws_s3_bucket_versioning" "shrini_backend_bucket_versioning" {

    bucket = aws_s3_bucket.shrini_backend_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "shrini_encryption" {
    bucket = aws_s3_bucket.shrini_backend_bucket.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
  
}