FROM jupyter/all-spark-notebook

USER root

RUN apt-get update && \
    apt-get install -yq libnetcdf-dev libhdf5-dev libgeos-dev libgdal-dev

RUN ln -s /usr/lib/libgeos-3.4.2.so /usr/lib/libgeos.so

ENV PYSPARK_PYTHON=/opt/conda/envs/python2/bin/python2

RUN cd /usr/local/spark/conf/ && \
    echo spark.driver.memory 16g > spark-defaults.conf

USER jovyan

RUN /opt/conda/envs/python2/bin/pip install test_helper

RUN conda install --name python2 \
    'pandas-datareader=0.2*'\
    'pillow=3.0*'\
    'pyproj=1.9*'\
    'pil=1.1*'\
    'netcdf4=1.1*'\
    'graphviz=2.38*'\
    'basemap=1.0*'\
    && conda clean -yt

RUN /opt/conda/envs/python2/bin/pip install networkx pyshp fiona xlrd folium shapely cesiumpy

USER root
