export GIT_COMMIT_SHA = $(shell git rev-parse HEAD)

secret:
	cat jupyterhub-derek_config.py | base64 >> jupyterhub-derek_config.txt

docker:
	docker build --no-cache ./ -t jupyterhub-derek

publish:
	docker tag jupyterhub-derek us.gcr.io/${GCLOUD_PROJECT_ID}/jupyterhub-derek:${GIT_COMMIT_SHA}
	gcloud docker -- push us.gcr.io/${GCLOUD_PROJECT_ID}/jupyterhub-derek:${GIT_COMMIT_SHA}

deploy:
	sed -e 's/%GCLOUD_PROJECT_ID%/${GCLOUD_PROJECT_ID}/g' -e 's/%GIT_COMMIT_SHA%/${GIT_COMMIT_SHA}/g' ./kubernetes-deployment.yaml > deployment.sed.yaml
	kubectl apply -f ./deployment.sed.yaml
	kubectl apply -f ./kubernetes-service.yaml

delete-kubernetes:
	kubectl delete deployment jupyterhub-derek-deployment

kubernetes: docker publish deploy