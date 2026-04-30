This playground includes a terminal connected to a Kubernetes cluster where you can run `kubectl` commands.

To verify that the cluster is up and running, run the following command in the terminal: 

```bash
kubectl get nodes
```

The output should show a single node in the `Ready` state:

```bash
NAME           STATUS   ROLES           AGE     VERSION
controlplane   Ready    control-plane   5d13h   v1.35.1
```

Click *START* to begin the scenario.
