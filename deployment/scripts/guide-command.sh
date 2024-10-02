# Connect to a postgresql-84c58898c5-9n9fd pod
kubectl exec -it postgresql-84c58898c5-9n9fd -- bash

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