export GIT_COMMIT_SHA = $(shell git rev-parse HEAD)

secret:
	cat jupyter-datascience-notebook_config.py | base64 >> jupyter-datascience-notebook_config.txt

docker:
	docker build ./ -t jupyter-datascience-notebook

publish:
	docker tag jupyter-datascience-notebook us.gcr.io/${GCLOUD_PROJECT_ID}/jupyter-datascience-notebook:${GIT_COMMIT_SHA}
	gcloud docker -- push us.gcr.io/${GCLOUD_PROJECT_ID}/jupyter-datascience-notebook:${GIT_COMMIT_SHA}

kubernetes: docker publish