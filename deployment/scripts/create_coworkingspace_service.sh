## Apply env variables and secrets
kubectl apply -f ../coworkingspace-service/env-secret.yml
kubectl apply -f ../coworkingspace-service/env-configmap.yml

## Deployments - Double check the Dockerhub image name and version in the deployment files
kubectl apply -f ../coworkingspace-service/app-deployment.yml

## Service
kubectl apply -f ../coworkingspace-service/app-services.yml
