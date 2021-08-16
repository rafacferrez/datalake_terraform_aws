resource "aws_s3_bucket" "dl" {
  bucket = "datalake-rafacferrez"
  acl    = "private"

  tags = {
    NAME   = "Rafael",
    CURSO = "IGTI"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}