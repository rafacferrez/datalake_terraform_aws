from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName("ExerciseSpark")
    .getOrCreate()
)

# Lendo os dados
enem = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", "|")
    .load("s3://datalake-rafacferrez/raw-data/DADOS/docentes_sudeste/")
)

# Escrevendo os dados
(
    enem
    .write
    .mode("overwrite")
    .parquet("s3://datalake-rafacferrez/staging/DADOS/docentes_sudeste/")
)
