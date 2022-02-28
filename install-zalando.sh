git clone https://github.com/zalando/postgres-operator.git
helm install postgres-operator ./postgres-operator/charts/postgres-operator
helm install postgres-operator-ui ./postgres-operator/charts/postgres-operator-ui
kubectl create -f postgres-operator/manifests/minimal-postgres-manifest.yaml



