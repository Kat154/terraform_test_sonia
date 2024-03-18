import boto3
import json
def handler(event={"data":[{"name":"sonia","id":1},{"name":"deepak","id":2}]},context=None):
    # print(f'event:{event}')
    s3_client = boto3.client('s3')
    response = s3_client.put_object(
    Body = json.dumps(event['data']).encode('utf-8'),
    Key = 'file_uploaded_via_terraform_17_march.json',
    Bucket = 'this-got-created-via-terraform-sonia-16march2024'
        )




