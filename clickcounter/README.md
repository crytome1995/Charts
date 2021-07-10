# clickcounter

##### Chart for bringing up the clickcounter webpage
Test template:  
```
helm template --dry-run clickcounter ./clickcounter/ --values ./clickcounter/values.yaml --set image.tag={{image-tag}} --set namespace=default
```
Install command:  
```
helm install clickcounter ./clickcounter/ --values ./clickcounter/values.yaml --set image.tag=b73c409e6c241d71de7b1b7c17977a86182761a0 --set --set namespace=default
```