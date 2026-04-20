curl -L https://github.com/isislab-unisa/scenarios/archive/main.zip -o scenarios.zip
unzip scenarios.zip -d scenarios
mkdir templates
mv scenarios/scenarios-main/kubernetes-system-design/* templates/
rm -rf scenarios.zip scenarios/scenarios-main scenarios

kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.0/standard-install.yaml
kubectl apply -f https://raw.githubusercontent.com/nginx/nginx-gateway-fabric/v1.6.2/deploy/crds.yaml
kubectl apply -f https://raw.githubusercontent.com/nginx/nginx-gateway-fabric/v1.6.2/deploy/default/deploy.yaml

kubectl wait --timeout=5m -n nginx-gateway \
    deployment/nginx-gateway \
    --for=condition=Available
