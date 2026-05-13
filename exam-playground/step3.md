Here you can find a list of useful commands.

## Print content of a file

```bash
cat <filename>
```

## Run BusyBox

```bash
kubectl run -it --rm --restart=Never busybox --image=busybox sh
```

## Query and endpoint of a service from within BusyBox

```bash
wget -qO- http://nginx-sidecar-svc
```

## Get sidecar container name

```bash
# Replace <label> with the appropriate label to select the pod
# For example, -l app=nginx-with-sidecar
POD_NAME=$(kubectl get pods \
    -l <label> \
    -o jsonpath='{.items[0].metadata.name}')

# Then print it to verify that it is correct
echo $POD_NAME
```