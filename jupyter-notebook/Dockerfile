FROM jupyter/minimal-notebook

RUN mkdir -p /etc/jupyter-notebook
RUN pip3 install oauthenticator

COPY ./jupyterhub_config.py /etc/jupyterhub

CMD ["jupyterhub", "-f", "/etc/jupyterhub/jupyterhub_config.py"]
