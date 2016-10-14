FROM jupyter/all-spark-notebook

USER root

ENV PYSPARK_PYTHON=/opt/conda/envs/python2/bin/python2

RUN cd /usr/local/spark/conf/ && \
    echo spark.driver.memory 8g > spark-defaults.conf && \
    echo spark.jars.packages com.databricks:spark-csv_2.10:1.5.0 >> spark-defaults.conf

USER jovyan

RUN /opt/conda/envs/python2/bin/pip install test_helper

USER root
