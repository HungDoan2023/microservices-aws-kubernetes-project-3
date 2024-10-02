
## Project: Coworking Space Service
The Coworking Space Service is a set of APIs that enables users to request one-time tokens and administrators to authorize access to a coworking space.

This service follows a microservice pattern and the APIs are split into distinct services that can be deployed and managed independently of one another.

For this project, you are a DevOps engineer who will be collaborating with a team that is building an API for business analysts. The API provides business analysts with basic analytics data on user activity in the coworking space service. The application they provide you functions as expected, and you will help build a pipeline to deploy it to Kubernetes.

### Build and Deploy Containers to ECR
#### Store Docker images in ECR
![](./images/cws-create-elastic-container-registry.png)

![](./images/cws-push-image-to-ecr-successful.png)


#### Kubernetes Configuration
1. Create EKS Cluster Successful

![](./images/cws-create-eks-cluster.png)
![](./images/cws-create-eks-cluster-1.png)

![](./images/cws-create-eks-successful.png)
![](./images/cws-create-eks-successful-1.png)
![](./images/cws-create-eks-successful-2.png)


2. Create PostgreSQL Service Successful
![](./images/cws-create-postgresql-service.png)
![](./images/cws-create-postgresql-service-1.png)
![](./images/cws-seed-and-verify-data.png)

3. Create CoWorkingSpace Service Successful
![](./images/cws-create-coworkingspace-service.png)
![](./images/cws-create-coworkingspace-service-1.png)

4. Describe services
![](./images/cws-describe-services.png)

![](./images/cws-describe-deployment-service.png)

![](./images/cws-describe-deployment-service-1.png)

![](./images/cws-describe-deployment-coworkingspace-service-2.png)


### Logging and Documentation
1. Display log content with CloudWatch

![](./images/cws-log-content-to-cloudwatch-successful.png)

![](./images/cws-log-content-to-cloudwatch-successful-1.png)

![](./images/cws-log-app-content-to-cloudwatch-successful-1.png)

![](./images/cws-log-app-content-to-cloudwatch-successful-2.png)

![](./images/cws-log-app-content-to-cloudwatch-successful-3.png)

2. Display log insights on CloudWatch
![](./images/cws-log-insights-cloudwatch-successful.png)


### Calling some Api
1. Readiness
![](./images/cws-test-readiness-ok.png)

2. Daily Usage
![](./images/cws-test-daily_usage-ok.png)

3. User Visits
![](./images/cws-test-user-visits-ok.png)

http://af83706a9bc3f47eebbfdbf0bada781f-1349447050.us-east-1.elb.amazonaws.com:5153/readiness_check

http://af83706a9bc3f47eebbfdbf0bada781f-1349447050.us-east-1.elb.amazonaws.com:5153/api/reports/daily_usage

http://af83706a9bc3f47eebbfdbf0bada781f-1349447050.us-east-1.elb.amazonaws.com:5153/api/reports/user_visits

### Thanks
Thank coach, mentor and the good course I'm able to finish the course. It's really a good valuation for me
