FROM jupyter/all-spark-notebook

USER root

RUN apt-get -y update && \
	apt-get install -yq \
    krb5-user \
    python-krbv \
    libkrb5-dev \
    libsasl2-dev \
    libsasl2-modules-gssapi-heimdal 

RUN cd /opt && \
    git clone https://github.com/sara-nl/hathi-client && \
    cp /opt/hathi-client/conf/krb5.conf /etc/krb5.conf && \
    /opt/hathi-client/bin/get.sh hadoop

ENV CLIENT_DIR=/opt/hathi-client
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
ENV KRB5_CONFIG=/opt/hathi-client/conf/krb5.conf
ENV HADOOP_HOME=/opt/hathi-client/hadoop
ENV HADOOP_CONF=/opt/hathi-client/hadoop/etc/hadoop
ENV HADOOP_CONF_DIR=/opt/hathi-client/hadoop/etc/hadoop
ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/hathi-client/hadoop/bin::/opt/hathi-client
ENV PYSPARK_PYTHON=/opt/conda/envs/python2/bin/python2

RUN cd /usr/local/spark/conf/ && \
    echo spark.driver.memory 16g > spark-defaults.conf

USER jovyan

RUN /opt/conda/envs/python2/bin/pip install "snakebite[kerberos]"
RUN /opt/conda/envs/python2/bin/pip install test_helper

USER root
