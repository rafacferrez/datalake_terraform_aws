import boto3
import os

s3_client = boto3.client('s3')

input_path = '../data/DADOS/'

list_files = os.listdir(input_path)

for files in list_files:

    output_path = os.path.join(files.replace('.CSV', ''), files)

    print("upando arquivo {}".format(files))
    s3_client.upload_file(os.path.join(input_path, files),
                          "datalake-rafacferrez",
                          os.path.join('raw-data/DADOS', output_path))
    print("arquivo {}".format(files))
