BACKEND_DEPLOYMENT_NAME="m-coworkingspace-service"

# Kubectl expose
kubectl expose deployment $BACKEND_DEPLOYMENT_NAME --type=LoadBalancer --name=publicbackend