FROM jupyter/all-spark-notebook

USER root

ENV PYSPARK_PYTHON=/opt/conda/envs/python2/bin/python2

COPY spark-defaults.conf /usr/local/spark/conf/
COPY pages.csv /home/jovyan/work/data/
COPY goals.csv /home/jovyan/work/data/


USER jovyan

RUN /opt/conda/envs/python2/bin/pip install test_helper

USER root
