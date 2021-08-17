resource "aws_glue_catalog_database" "database" {
  name = "datalake_rafael"
}

resource "aws_glue_crawler" "crawler" {
  database_name = aws_glue_catalog_database.database.name
  name          = "microdados_crawler"
  role          = "IGTIGlueCrawlerRole"

  s3_target {
    path = "s3://datalake-rafacferrez/staging/DADOS"
  }
}