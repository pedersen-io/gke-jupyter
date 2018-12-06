export GIT_COMMIT_SHA = $(shell git rev-parse HEAD)

secret:
	cat jupyter-singleuser_config.py | base64 >> jupyter-singleuser_config.txt

docker:
	docker build ./ -t jupyter-singleuser

publish:
	docker tag jupyter-singleuser us.gcr.io/${GCLOUD_PROJECT_ID}/jupyter-singleuser:${GIT_COMMIT_SHA}
	gcloud docker -- push us.gcr.io/${GCLOUD_PROJECT_ID}/jupyter-singleuser:${GIT_COMMIT_SHA}

kubernetes: docker publish deploy