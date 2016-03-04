# jupyter-bigdata-docker

Jupyter docker environment for big data courses

This repository contains several different dockerized Jupyter and Spark environments:

1. local: a Jupyter environment configured to run in Spark local mode only
2. local-hdfs: a Jupyter environment configured to run in Spark local mode with access to SURFsara's HDFS
3. yarn-hdfs: a Jupyter environment configured to run in Spark yarn-client mode with executores on SURFsara's YARN cluster and access to HDFS.