
# Forked the repository from https://github.com/mickeyjohn/explore_california
# and cloned it locally:

git clone https://github.com/YOUR_GITHUB_USERNAME/explore_california.git
cd explore_california

# Containerization

# Wrote a Dockerfile

cat <<EOF > Dockerfile
# Use an official Nginx image as a base
FROM nginx:alpine

# Copy the application code to the container
COPY . /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80
EOF

# Built the Docker Image

docker build -t nareshbabumanam/explore-california:latest .

# Tested the Containerized App

docker run -p 8080:80 nareshbabumanam/explore-california:latest

# Accessed the app at http://localhost:8080

# AKS Setup

# Connected to AKS Cluster

# Ensured Azure CLI and kubectl were installed and configured.
# Connected to the AKS cluster:

az aks get-credentials --resource-group myResourceGroup --name myAKSCluster

# Kubernetes Deployment

# Created Kubernetes Manifest Files

# Deployment Manifest (deployment.yaml):

cat <<EOF > deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: explore-california
spec:
  replicas: 1
  selector:
    matchLabels:
      app: explore-california
  template:
    metadata:
      labels:
        app: explore-california
    spec:
      containers:
      - name: explore-california
        image: nareshbabumanam/explore-california:latest
        ports:
        - containerPort: 80
EOF

# Service Manifest (service.yaml):

cat <<EOF > service.yaml
apiVersion: v1
kind: Service
metadata:
  name: explore-california-service
spec:
  type: LoadBalancer
  selector:
    app: explore-california
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF

# Applied Kubernetes Manifests

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Verification

# Checked Services and External IP

kubectl get svc

# Found the EXTERNAL-IP assigned to the explore-california-service
# and opened a browser to navigate to http://<EXTERNAL-IP>
