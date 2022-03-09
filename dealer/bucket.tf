terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0" 
        }
    }
}
variable "AWS_ACCESS_KEY_ID" {}

variable "AWS_SECRET_ACCESS_KEY" {}

variable "region" {
    type = string
    default = "us-east-2"
}
variable "bucket" {
    type = string
    default = "cesarwebbucket1"
}

variable "content" {    
    type = string
} 

provider "aws" {
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
    region = "us-east-2"
    
}

/*------------bucket------------*/

resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket
  acl = "public-read"
  website {
      index_document = "index.html"
  }
}

/*------------content------------*/

resource "aws_s3_bucket_object" "object1" {
  bucket = aws_s3_bucket.bucket1.bucket
  key    = "index.html"
  acl = "public-read"
  content = var.content
  content_type = "text/html"
}