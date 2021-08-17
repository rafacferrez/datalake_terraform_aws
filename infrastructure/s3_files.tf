resource "aws_s3_bucket_object" "job_spark_docentes_co" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_docentes_co.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_docentes_co.py"
  etag   = filemd5("../etl/pyspark/job_spark_docentes_co.py")

}
resource "aws_s3_bucket_object" "job_spark_docentes_nordeste" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_docentes_nordeste.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_docentes_nordeste.py"
  etag   = filemd5("../etl/pyspark/job_spark_docentes_nordeste.py")
}

resource "aws_s3_bucket_object" "job_spark_docentes_norte" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_docentes_norte.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_docentes_norte.py"
  etag   = filemd5("../etl/pyspark/job_spark_docentes_norte.py")
}

resource "aws_s3_bucket_object" "job_spark_docentes_sudeste" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_docentes_sudeste.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_docentes_sudeste.py"
  etag   = filemd5("../etl/pyspark/job_spark_docentes_sudeste.py")
}

resource "aws_s3_bucket_object" "job_spark_docentes_sul" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_docentes_sul.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_docentes_sul.py"
  etag   = filemd5("../etl/pyspark/job_spark_docentes_sul.py")
}

resource "aws_s3_bucket_object" "job_spark_escolas" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_escolas.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_escolas.py"
  etag   = filemd5("../etl/pyspark/job_spark_escolas.py")
}

resource "aws_s3_bucket_object" "job_spark_gestor" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_gestor.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_gestor.py"
  etag   = filemd5("../etl/pyspark/job_spark_gestor.py")
}

resource "aws_s3_bucket_object" "job_spark_matricula_co" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_matricula_co.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_matricula_co.py"
  etag   = filemd5("../etl/pyspark/job_spark_matricula_co.py")
}

resource "aws_s3_bucket_object" "job_spark_matricula_nordeste" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_matricula_nordeste.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_matricula_nordeste.py"
  etag   = filemd5("../etl/pyspark/job_spark_matricula_nordeste.py")
}

resource "aws_s3_bucket_object" "job_spark_matricula_norte" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_matricula_norte.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_matricula_norte.py"
  etag   = filemd5("../etl/pyspark/job_spark_matricula_norte.py")
}

resource "aws_s3_bucket_object" "job_spark_matricula_sudeste" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_matricula_sudeste.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_matricula_sudeste.py"
  etag   = filemd5("../etl/pyspark/job_spark_matricula_sudeste.py")
}

resource "aws_s3_bucket_object" "job_spark_matricula_sul" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_matricula_sul.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_matricula_sul.py"
  etag   = filemd5("../etl/pyspark/job_spark_matricula_sul.py")
}

resource "aws_s3_bucket_object" "job_spark_turmas" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/job_spark_turmas.py"
  acl    = "private"
  source = "../etl/pyspark/job_spark_turmas.py"
  etag   = filemd5("../etl/pyspark/job_spark_turmas.py")
}