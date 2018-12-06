FROM jupyterhub/jupyterhub

RUN mkdir -p /etc/jupyterhub-derek
RUN pip3 install oauthenticator && \
    pip3 install jupyter && \ 
    pip3 install jupyterhub-kubespawner

COPY ./jupyterhub-derek_config.py /etc/jupyterhub-derek

CMD ["jupyterhub", "-f", "/etc/jupyterhub-derek/jupyterhub-derek_config.py"]
