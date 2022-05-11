provider "aws" {
    region = "us-west-2"
    access_key = "AKIA337CZV5XK5CYGYKL"
    secret_key = "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"
  
}
resource "aws_s3_bucket" "mybucket" {
    bucket = "mybucket-demo-25042022"
    acl = "private"
    tags ={
        Envinonemnt = "Dev"
            
    }
  
}
resource "aws_s3_bucket_object" "mybucket" {
  bucket = "${aws_s3_bucket.mybucket.id}"
  key    = "test-bucket"
  source = "../S3-bucket/test-bucket"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("../S3-bucket/test-bucket")
}

  
  

