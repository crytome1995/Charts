# clickgetter

##### Chart for bringing up the clickgetter webpage

Test template:

```
helm template --dry-run clickgetter ./clickgetter/ --values ./clickgetter/values.yaml --set image.tag={{image-tag}} --set namespace=default
```

Install command:

```
helm install clickgetter ./clickgetter/ --values ./clickgetter/values.yaml --set image.tag=b73c409e6c241d71de7b1b7c17977a86182761a0 --set --set namespace=default
```
