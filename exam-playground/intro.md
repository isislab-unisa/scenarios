# Your first single container deployment

Click start to begin the scenario. You will be presented with a terminal and a browser window. The terminal is connected to a Kubernetes cluster where you can run `kubectl` commands. The browser window is connected to the cluster's API server, allowing you to access services running in the cluster.

To verify that the cluster is up and running, run the following command in the terminal:
```bash
kubectl get deployment -n nginx-gateway
kubectl get gatewayclass
``` 
