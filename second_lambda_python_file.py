import json
import boto3
def handler(event = None,context= None):
    s3_resource = boto3.resource('s3')
    s3_bucket = s3_resource.Bucket('this-got-created-via-terraform-sonia-16march2024')
    s3_file_object = s3_bucket.Object('file_uploaded_via_terraform.json').get()["Body"].read()
    decoded_info = s3_file_object.decode()
    print(f'decoded information: {decoded_info}')
    print(f'type:{type(decoded_info)}')