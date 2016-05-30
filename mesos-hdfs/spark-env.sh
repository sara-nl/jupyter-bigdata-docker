#!/usr/bin/env bash
export MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so
#export SPARK_EXECUTOR_URI=hdfs://hadoop.borg.surfsara.nl/applications/spark/jovyan/spark-1.5.1-bin-hadoop2.6.tgz
export MASTER=mesos://leader.service.consul:5050
export SPARK_DRIVER_MEMORY=4G
export SPARK_JAVA_OPTS="-Dspark.driver.port=54308 -Dspark.ui.port=14048"