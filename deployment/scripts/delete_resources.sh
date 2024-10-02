ClusterName=coworkingspace
RegionName=us-east-1

eksctl delete cluster --name "$ClusterName" --region "$RegionName"