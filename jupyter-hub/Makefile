export GIT_COMMIT_SHA = $(shell git rev-parse HEAD)

docker:
	sed -e 's/%GCLOUD_PROJECT_ID%/${GCLOUD_PROJECT_ID}/g' ./jupyter-hub_config.template.py > jupyter-hub_config.py
	docker build ./ -t jupyter-hub

publish:
	docker tag jupyter-hub us.gcr.io/${GCLOUD_PROJECT_ID}/jupyter-hub:${GIT_COMMIT_SHA}
	gcloud docker -- push us.gcr.io/${GCLOUD_PROJECT_ID}/jupyter-hub:${GIT_COMMIT_SHA}

deploy:
	sed -e 's/%GCLOUD_PROJECT_ID%/${GCLOUD_PROJECT_ID}/g' -e 's/%GIT_COMMIT_SHA%/${GIT_COMMIT_SHA}/g' ./kubernetes-deployment.yaml > deployment.sed.yaml
	kubectl apply -f ./deployment.sed.yaml
	kubectl apply -f ./kubernetes-service.yaml

delete-kubernetes:
	kubectl delete deployment jupyter-hub-deployment

kubernetes: docker publish deploy