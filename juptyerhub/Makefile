export GIT_COMMIT_SHA = $(shell git rev-parse HEAD)

secret:
	cat jupyterhub_config.py | base64 >> jupyterhub_config.txt

docker:
	docker build ./ -t jupyterhub

publish:
	docker tag jupyterhub us.gcr.io/${GCLOUD_PROJECT_ID}/jupyterhub:${GIT_COMMIT_SHA}
	gcloud docker -- push us.gcr.io/${GCLOUD_PROJECT_ID}/jupyterhub:${GIT_COMMIT_SHA}

deploy:
	sed -e 's/%GCLOUD_PROJECT_ID%/${GCLOUD_PROJECT_ID}/g' -e 's/%GIT_COMMIT_SHA%/${GIT_COMMIT_SHA}/g' ./kubernetes-deployment.yaml > deployment.sed.yaml
	kubectl apply -f ./deployment.sed.yaml
	kubectl apply -f ./kubernetes-service.yaml