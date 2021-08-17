import boto3


def handler(event, context):
    """
    Lambda function that starts a job flow in EMR.
    """
    client = boto3.client('emr', region_name='us-east-2')

    list_jobs = ['docentes_co', 'docentes_nordeste',
                 'docentes_norte', 'docentes_sudeste',
                 'docentes_sul', 'escolas',
                 'gestor', 'matricula_co',
                 'matricula_nordeste', 'matricula_norte',
                 'matricula_sudeste', 'matricula_sul',
                 'turmas']

    list_steps = []
    for job in list_jobs:
        list_steps.append({
            'Name': 'Convert to parquet',
            'ActionOnFailure': 'CONTINUE',
            'HadoopJarStep': {
                'Jar': 'command-runner.jar',
                'Args': ['spark-submit',
                         '--master', 'yarn',
                         '--deploy-mode', 'cluster',
                         's3://datalake-rafacferrez/emr-code/pyspark/job_spark_{}.py'.format(
                             job)
                         ]
            }
        })

    cluster_id = client.run_job_flow(
        Name='EMR-Rafael',
        ServiceRole='EMR_DefaultRole',
        JobFlowRole='EMR_EC2_DefaultRole',
        VisibleToAllUsers=True,
        LogUri='s3://datalake-rafacferrez/emr-logs',
        ReleaseLabel='emr-6.3.0',
        Instances={
            'InstanceGroups': [
                {
                    'Name': 'Master nodes',
                    'Market': 'SPOT',
                    'InstanceRole': 'MASTER',
                    'InstanceType': 'm5.xlarge',
                    'InstanceCount': 1,
                },
                {
                    'Name': 'Worker nodes',
                    'Market': 'SPOT',
                    'InstanceRole': 'CORE',
                    'InstanceType': 'm5.xlarge',
                    'InstanceCount': 1,
                }
            ],
            'Ec2KeyName': 'rafacferrez-keypair',
            'KeepJobFlowAliveWhenNoSteps': True,
            'TerminationProtected': False,
            'Ec2SubnetId': 'subnet-0be3b347'
        },

        Applications=[
            {'Name': 'Spark'},
            {'Name': 'Hive'},
            {'Name': 'Pig'},
            {'Name': 'Hue'},
            {'Name': 'JupyterHub'},
            {'Name': 'JupyterEnterpriseGateway'},
            {'Name': 'Livy'},
        ],

        Configurations=[{
            "Classification": "spark-env",
            "Properties": {},
            "Configurations": [{
                "Classification": "export",
                "Properties": {
                        "PYSPARK_PYTHON": "/usr/bin/python3",
                        "PYSPARK_DRIVER_PYTHON": "/usr/bin/python3"
                        }
            }]
        },
            {
            "Classification": "spark-hive-site",
                "Properties": {
                    "hive.metastore.client.factory.class": "com.amazonaws.glue.catalog.metastore.AWSGlueDataCatalogHiveClientFactory"
                }
        },
            {
            "Classification": "spark-defaults",
                "Properties": {
                    "spark.submit.deployMode": "cluster",
                    "spark.speculation": "false",
                    "spark.sql.adaptive.enabled": "true",
                    "spark.serializer": "org.apache.spark.serializer.KryoSerializer"
                }
        },
            {
            "Classification": "spark",
                "Properties": {
                    "maximizeResourceAllocation": "true"
                }
        }
        ],

        StepConcurrencyLevel=1,

        Steps=list_steps
    )

    return {
        'statusCode': 200,
        'body': f"Started job flow {cluster_id['JobFlowId']}"
    }
