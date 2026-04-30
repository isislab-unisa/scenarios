Verify that the Gateway is running and the GatewayClass is accepted:

```bash
kubectl get deployment -n nginx-gateway
kubectl get gatewayclass
```

You should see the `nginx-gateway` Deployment and the `nginx-gateway-class` GatewayClass in the output:

```bash
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
nginx-gateway   1/1     1            1           23m

NAME    CONTROLLER                                   ACCEPTED   AGE
nginx   gateway.nginx.org/nginx-gateway-controller   True       24m
```
