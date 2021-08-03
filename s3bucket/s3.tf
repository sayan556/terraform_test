resource "aws_s3_bucket" "my-bucket" {
  bucket = "exam-bucket13"
  acl    = "public-read"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  for_each = fileset("","*")
  bucket = "${aws_s3_bucket.my-bucket.id}"
  key    = "${each.value}"
  acl = "public-read-write"
  source = "${each.value}"
  # etag = filemd5("${each.value}")
}