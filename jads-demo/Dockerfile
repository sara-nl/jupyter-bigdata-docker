FROM jupyter/all-spark-notebook

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    julia \
    libnettle4 && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -yq libnetcdf-dev libhdf5-dev libgeos-dev libgdal-dev

RUN ln -s /usr/lib/libgeos-3.4.2.so /usr/lib/libgeos.so

ENV PYSPARK_PYTHON=/opt/conda/envs/python2/bin/python2

RUN cd /usr/local/spark/conf/ && \
    echo spark.driver.memory 16g > spark-defaults.conf

USER jovyan

RUN /opt/conda/envs/python2/bin/pip install test_helper

RUN conda config --add channels r && \
    conda install --quiet --yes \
    'rpy2=2.7*' \
    'r-base=3.2*' \
    'r-irkernel=0.5*' \
    'r-plyr=1.8*' \
    'r-devtools=1.9*' \
    'r-dplyr=0.4*' \
    'r-ggplot2=1.0*' \
    'r-tidyr=0.3*' \
    'r-shiny=0.12*' \
    'r-rmarkdown=0.8*' \
    'r-forecast=5.8*' \
    'r-rsqlite=1.0*' \
    'r-reshape2=1.4*' \
    'r-nycflights13=0.1*' \
    'r-caret=6.0*' \
    'r-rcurl=1.95*' \
    'r-randomforest=4.6*' && conda clean -tipsy

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

RUN julia -e 'Pkg.add("IJulia")' && \
    mv /home/jovyan/.local/share/jupyter/kernels/julia* $CONDA_DIR/share/jupyter/kernels/ && \
    chmod -R go+rx $CONDA_DIR/share/jupyter

RUN echo "push!(Sys.DL_LOAD_PATH, \"$CONDA_DIR/lib\")" > /home/jovyan/.juliarc.jl && \
    julia -e 'Pkg.add("Gadfly")' && julia -e 'Pkg.add("RDatasets")' && julia -F -e 'Pkg.add("HDF5")'

USER root
