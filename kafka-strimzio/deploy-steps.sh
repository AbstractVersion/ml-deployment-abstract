# Check here for documentation https://strimzi.io/docs/operators/in-development/deploying.html
# Get installation files
wget https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.30.0/strimzi-0.30.0.tar.gz && tar -xvf strimzi-0.30.0.tar.gz

cd strimzi-0.30.0/
kubectl create ns strimzi-operator
# Edit the Strimzi installation files to use the namespace the Cluster Operator is going to be installed into.
sed -i 's/namespace: .*/namespace: strimzi-operator/' install/cluster-operator/*RoleBinding*.yaml



# READY shows the number of replicas that are ready/expected. The deployment is successful when the AVAILABLE output shows 1.


# In case of all namespace watch deployment
# REPLACE ON install/cluster-operator/060-Deployment-strimzi-cluster-operator.yaml
        # env:
        # - name: STRIMZI_NAMESPACE
        #   value: "*"
#AND

kubectl create clusterrolebinding strimzi-cluster-operator-namespaced --clusterrole=strimzi-cluster-operator-namespaced --serviceaccount strimzi-operator:strimzi-cluster-operator
kubectl create clusterrolebinding strimzi-cluster-operator-entity-operator-delegation --clusterrole=strimzi-entity-operator --serviceaccount strimzi-operator:strimzi-cluster-operator

# Deploy the Cluster Operator:
kubectl create -f install/cluster-operator -n strimzi-operator


# Check the status of the deployment:
kubectl get all -n strimzi-operator


# Configure prometheous

kubectl apply -f examples/metrics/prometheus-additional-properties/prometheus-additional.yaml -n cattle-monitoring-system
kubectl apply -f examples/metrics/prometheus-install/strimzi-pod-monitor.yaml -n cattle-monitoring-system 
# create a kafka yaml and deploy it


