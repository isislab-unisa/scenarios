kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.0/standard-install.yaml
kubectl apply -f https://raw.githubusercontent.com/nginx/nginx-gateway-fabric/v1.6.2/deploy/crds.yaml
kubectl apply -f https://raw.githubusercontent.com/nginx/nginx-gateway-fabric/v1.6.2/deploy/default/deploy.yaml

kubectl wait --timeout=5m -n nginx-gateway \
    deployment/nginx-gateway \
    --for=condition=Available

kubectl create deployment dashboard \
    --image=paulbouwer/hello-kubernetes:1.10 \
    --port=8080
kubectl set env deployment/dashboard MESSAGE="Main Dashboard"

kubectl create deployment admin \
    --image=paulbouwer/hello-kubernetes:1.10 \
    --port=8080
kubectl set env deployment/admin MESSAGE="Admin Panel"

kubectl expose deployment dashboard \
    --name=dashboard-svc \
    --type=ClusterIP \
    --port=80 \
    --target-port=8080

kubectl expose deployment admin \
    --name=admin-svc \
    --type=ClusterIP \
    --port=80 \
    --target-port=8080

cat > gateway.yaml <<EOF
apiVersion: gateway.networking.k8s.io/v1beta1
kind: Gateway
metadata:
  name: my-gateway
spec:
  gatewayClassName: nginx
  listeners:
  - name: http
    port: 80
    protocol: HTTP
EOF

kubectl apply -f gateway.yaml

cat > httproute.yaml <<EOF
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: app-routes
spec:
  parentRefs:
    - name: app-gateway
  rules:
    - matches:
        - path:
            type: PathPrefix
            value: /dashboard
      filters:
        - type: URLRewrite
          urlRewrite:
            path:
              type: ReplacePrefixMatch
              replacePrefixMatch: /
      backendRefs:
        - name: dashboard-svc
          port: 80
    - matches:
        - path:
            type: PathPrefix
            value: /admin
      filters:
        - type: URLRewrite
          urlRewrite:
            path:
              type: ReplacePrefixMatch
              replacePrefixMatch: /
      backendRefs:
        - name: admin-svc
          port: 80
EOF

kubectl apply -f httproute.yaml

NODE_IP=$(kubectl get nodes \
    -o jsonpath='{.items[0].status.addresses[0].address}')

NODE_PORT=$(kubectl get svc -n nginx-gateway \
    -o jsonpath='{.items[0].spec.ports[0].nodePort}')
