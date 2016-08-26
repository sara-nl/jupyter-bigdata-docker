FROM jupyter/demo

# from https://github.com/jupyterhub/dockerspawner

EXPOSE 8888

# nbgrader
RUN conda install --quiet --yes -c jhamrick nbgrader && \
    conda clean -tipsy && \
    nbgrader extension install

USER root
RUN wget -q https://raw.githubusercontent.com/jupyterhub/jupyterhub/0.6.1/scripts/jupyterhub-singleuser -O /usr/local/bin/jupyterhub-singleuser && \
    chmod 755 /usr/local/bin/jupyterhub-singleuser

RUN userdel jovyan
ENV SHELL /bin/bash

RUN mkdir /srv/singleuser && \
    wget -q https://raw.githubusercontent.com/jupyterhub/dockerspawner/0.4.0/systemuser/systemuser.sh -O /srv/singleuser/systemuser.sh

# smoke test entrypoint
RUN USER_ID=65000 USER=systemusertest sh /srv/singleuser/systemuser.sh -h && userdel systemusertest

CMD ["sh", "/srv/singleuser/systemuser.sh"]
