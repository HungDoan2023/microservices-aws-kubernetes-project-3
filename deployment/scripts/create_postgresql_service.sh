## Apply env variables and secrets
kubectl apply -f ../postgresql-service/pvc.yml
kubectl apply -f ../postgresql-service/pv.yml

## Deployments - Double check the Dockerhub image name and version in the deployment files
kubectl apply -f ../postgresql-service/postgresql-deployment.yml

## Service
kubectl apply -f ../postgresql-service/postgresql-service.yml
