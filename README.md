# **Installation Zalando on Kubernetes**
This tutorial is based on [this](https://github.com/zalando/postgres-operator) github
### **How to**
1. Run script 
```
./install-zalando.sh
```
### **Port Forward Zalando UI**
1. Run command
```
kubectl port-forward svc/postgres-operator-ui 8081:80
```
### **Port Forward Postgres**
1. Run command
```
export PGMASTER=$(kubectl get pods -o jsonpath={.items..metadata.name} -l application=spilo,cluster-name=acid-minimal-cluster,spilo-role=master -n default)
kubectl port-forward $PGMASTER 6432:5432 -n default
```
### **Login to Postgres**
1. Run command
```
export PGPASSWORD=$(kubectl get secret postgres.acid-minimal-cluster.credentials.postgresql.acid.zalan.do -o 'jsonpath={.data.password}' | base64 -d)
export PGSSLMODE=require
psql -U postgres -h localhost -p 6432
```

