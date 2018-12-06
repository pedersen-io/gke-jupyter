FROM jupyterhub/jupyterhub:0.9.4

RUN mkdir -p /etc/jupyterhub-derek
RUN pip install oauthenticator && \
    pip install jupyter && \ 
    pip install jupyterhub-kubespawner

COPY ./jupyterhub-derek_config.py /etc/jupyterhub-derek

CMD ["jupyterhub", "-f", "/etc/jupyterhub-derek/jupyterhub-derek_config.py"]
