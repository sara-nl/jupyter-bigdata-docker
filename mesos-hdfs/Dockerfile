FROM jupyter/all-spark-notebook

USER root

RUN cd /opt && \
    git clone https://github.com/sara-nl/hathi-client && \
    /opt/hathi-client/bin/get.sh hadoop && \
    ln -s /opt/conda/envs/python2/bin/python2 /usr/local/bin/python

ENV CLIENT_DIR=/opt/hathi-client
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
ENV HADOOP_HOME=/opt/hathi-client/hadoop
ENV HADOOP_CONF=/opt/hathi-client/hadoop/etc/hadoop
ENV HADOOP_CONF_DIR=/opt/hathi-client/hadoop/etc/hadoop
ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/hathi-client/hadoop/bin::/opt/hathi-client
ENV PYSPARK_PYTHON=/usr/local/bin/python

COPY spark-defaults.conf /usr/local/spark/conf/
COPY spark-env.sh /usr/local/spark/conf/
COPY core-site.xml /opt/hathi-client/hadoop/etc/hadoop/
COPY hdfs-site.xml /opt/hathi-client/hadoop/etc/hadoop/
COPY hadoop-env.sh /opt/hathi-client/hadoop/etc/hadoop/

RUN cd /opt/hathi-client/hadoop/etc/hadoop/ && \
    rm yarn-site.xml

USER jovyan

RUN mkdir /home/jovyan/work/data && \
	cd /home/jovyan/work/data && \
	wget http://beehub.nl/surfsara-hadoop/public/2008.csv.gz && \
	wget http://beehub.nl/surfsara-hadoop/public/20newsgroups.labelled.json.gz && \
	wget http://beehub.nl/surfsara-hadoop/public/alice.txt

RUN cd /home/jovyan && \
	git clone https://github.com/sara-nl/jupyter-bigdata-notebooks && \
	ln -s /home/jovyan/jupyter-bigdata-notebooks/notebooks/ /home/jovyan/work/notebooks/

RUN /opt/conda/envs/python2/bin/pip install "snakebite"
RUN /opt/conda/envs/python2/bin/pip install test_helper

USER root
