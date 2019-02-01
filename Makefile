export GIT_COMMIT_SHA = $(shell git rev-parse HEAD)

notebook-build-publish-deploy:
	cd ./jupyter-datascience-notebook && make kubernetes

hub-build-publish-deploy:
	cd ./jupyter-hub && make kubernetes

gke-jupyter: notebook-build-publish-deploy hub-build-publish-deploy

delete-gke-jupyter:
	cd ./jupyter-hub && make delete-kubernetes