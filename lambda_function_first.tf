data "archive_file" "first_lambda_file"{
  type = "zip"
  source_file = "first_lambda_python_file.py"
  output_path = "first_lambda_python_file.zip"
}

resource "aws_lambda_function" "first_lambda_function"{
  filename = "first_lambda_python_file.zip"
  function_name = "first_lambda_function_via_terraform"
  role = aws_iam_role.role_for_lambda_to_access_sonia_terraform_created_bucket_16march2024.arn
  handler = "first_lambda_python_file.handler"
  source_code_hash = "data.archive_file.first_lambda_file.output_base64sha256"
  runtime = "python3.11"
  environment {
    variables ={
      author_name = "sonia"
    }
  }
}

//resource "aws_s3_bucket_object" "object_to_be_uploaded_to_s3"{
//  bucket = "store-laptop-backup"
//  key = "my_new_s3_file_uploaded_via_terraform.txt"
//  source = "/mnt/d/work/terraform/file_to_be_uploaded_to_s3_via_terraform.txt"
//}

data "archive_file" "second_lambda_file"{
  type = "zip"
  source_file = "second_lambda_python_file.py"
  output_path = "second_lambda_python_file.zip"
}
resource "aws_lambda_function" "second_lambda_function"{
  filename = "second_lambda_python_file.zip"
  function_name = "second_lamdba_function_via_terraform"
  role = aws_iam_role.role_for_second_lambda_to_access_s3.arn
  handler = "second_lambda_python_file.handler"
  source_code_hash = "data.archive_file.second_lambda_file.output_base64sha256"
  runtime = "python3.11"
  environment {
    variables ={
      author_name="sonia"
      function_number = "this is second function"
    }
  }
}