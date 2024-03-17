

data "aws_iam_policy_document" "ability_for_lambda_to_assume_role_in_aws"{
  statement {
//    actions = ["sts:AssumeRole"]
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    effect = "Allow"
  }
}
resource "aws_iam_role" "role_for_lambda_to_access_sonia_terraform_created_bucket_16march2024"{
  name = "allow_lambda_to_access_bucket_sonia_terraform"
assume_role_policy = data.aws_iam_policy_document.ability_for_lambda_to_assume_role_in_aws.json
}

//resourcce "aws_iam_role" "role_for_first_lambda_to_access_s3"{
//  name = "role_for_first_lambda_to_access_s3_aws"
//
//}
resource "aws_iam_policy" "s3_bucket_access_for_first_lambda_function"{
  name = "s3_bucket_access_for_first_lambda_function_via_terraform"
  description = "this is being done to attach my s3 bucket access to my lambda function so that i can complete first exercise"
  policy =   data.aws_iam_policy_document.policy_for_s3_access.json

    }
data "aws_iam_policy_document" "policy_for_s3_access"{
  statement{
    effect = "Allow"
    actions = ["s3:*"]
//    resources = ["arn:aws:s3:::this-got-created-via-terraform-sonia-16march2024"]
    resources  = [aws_s3_bucket.aws_s3_sonia_terraform_created_bucket_16march2024.arn]
  }

}

resource "aws_iam_role_policy_attachment" "attach_s3_access_for_first_lambda_function" {
        role =  aws_iam_role.role_for_lambda_to_access_sonia_terraform_created_bucket_16march2024.name
        policy_arn = aws_iam_policy.s3_bucket_access_for_first_lambda_function.arn
}
//----------------------------------------------------------------------------
//resource "aws_iam_role" "role_for_second_lambda_to_access_s3"{
//  name = "role_for_second_lambda_function_to_access_s3"
//  assume_role_policy = data.aws_iam_policy_document.ability_for_lambda_to_assume_role_in_aws.json
//}
//
//resource "aws_iam_policy" "policy_for_s3_access_for_second_lambda"{
//  name = "s3_bucket_access_for_second_lambda_function_via_terraform"
//  description = "to give access of our bucket to second lambda function"
//  policy = data.aws_iam_policy_document.policy_for_s3_access_for_second_lambda.json
//}
//
//data "aws_iam_policy_document" "policy_for_s3_access_for_second_lambda"{
//  statement{
//    effect = "Allow"
//    actions = ["s3:*"]
//    resources = ["arn:aws:s3:::this-got-created-via-terraform-sonia-16march2024"]
//  }
//}
//
//resource "aws_iam_role_policy_attachment" "attach_s3_access_for_second_lambda_function"{
//  role = aws_iam_role.role_for_second_lambda_to_access_s3.name
//  policy_arn = aws_iam_policy.policy_for_s3_access_for_second_lambda.arn
//}