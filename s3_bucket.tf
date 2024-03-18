
resource "aws_s3_bucket" "aws_s3_sonia_terraform_created_bucket_16march2024"{
  bucket = "this-got-created-via-terraform-sonia-16march2024"
  tags = {
    Name = "S3 Terraform Bucket"
    Environment = "TestEnvironment"
  }
}

//resource "aws_s3_bucket" "aws_s3_bucket_for_storing_my_laptop_backup"{
//  bucket = "store-laptop-backup"
//  tags ={
//    Name = "Predator Laptop backup"
//  }
//}