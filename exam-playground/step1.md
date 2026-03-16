# Exam playground

Here are the commands to verify that the cluster is up and running:
```bash
kubectl get deployment -n nginx-gateway
kubectl get gatewayclass
```

You should see the `nginx-gateway` Deployment and the `nginx-gateway-class` GatewayClass in the output.

```bash
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
nginx-gateway   1/1     1            1           23m
```
```bash
NAME    CONTROLLER                                   ACCEPTED   AGE
nginx   gateway.nginx.org/nginx-gateway-controller   True       24m
```

The floor is yours!
