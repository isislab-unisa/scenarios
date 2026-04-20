Your first single container deployment

You will be presented with a terminal and a browser window. The terminal is connected to a Kubernetes cluster where you can run `kubectl` commands. The browser window is connected to the cluster's API server, allowing you to access services running in the cluster.


The background script will setup a templates folder in ~ folder, where you can find yaml files corresponding to each task in the book.

To verify that the cluster is up and running, run the following command in the terminal: 
You can check that with the following command:

```bash
kubectl wait --timeout=5m -n nginx-gateway \
    deployment/nginx-gateway \
    --for=condition=Available
```

```bash
kubectl get deployment -n nginx-gateway
kubectl get gatewayclass
```



Click start to begin the scenario.

