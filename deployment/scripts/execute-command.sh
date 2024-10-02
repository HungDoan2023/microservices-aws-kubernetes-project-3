# Connect to a postgresql-84c58898c5-8w5mg pod
kubectl exec -it postgresql-84c58898c5-8w5mg -- bash

# Update psql
apt update
apt install postgresql postgresql-contrib

# Connect to database
psql -U postgres -d database-1

# Connecting Via Port Forwarding (It should be created on saprately Terminal Tab)
kubectl port-forward service/postgresql-service 5433:5432 &

# Kill Port Forwarding (If you would dispose Port Forwarding)
ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}' | xargs -r kill

# Seed data to postgresql-service (It should be created on saprately Terminal Tab)
export DB_PASSWORD=123postgres456
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U postgres -d database-1 -p 5433 -f ../db/1_create_tables.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U postgres -d database-1 -p 5433 -f ../db/2_seed_users.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U postgres -d database-1 -p 5433 -f ../db/3_seed_tokens.sql

# pip install -r requirements.txt


DB_USERNAME=postgres DB_PASSWORD=123postgres456 python ../../analytics/app.py

# Expose the Backend API to the Internet
kubectl expose deployment m-coworkingspace-service --type=LoadBalancer --name=publicbackend


ClusterName=coworkingspace
RegionName=us-east-1
FluentBitHttpPort='2020'
FluentBitReadFromHead='Off'
[[ ${FluentBitReadFromHead} = 'On' ]] && FluentBitReadFromTail='Off'|| FluentBitReadFromTail='On'
[[ -z ${FluentBitHttpPort} ]] && FluentBitHttpServer='Off' || FluentBitHttpServer='On'
curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluent-bit-quickstart.yaml | sed 's/{{cluster_name}}/'${ClusterName}'/;s/{{region_name}}/'${RegionName}'/;s/{{http_server_toggle}}/"'${FluentBitHttpServer}'"/;s/{{http_server_port}}/"'${FluentBitHttpPort}'"/;s/{{read_from_head}}/"'${FluentBitReadFromHead}'"/;s/{{read_from_tail}}/"'${FluentBitReadFromTail}'"/' | kubectl apply -f -