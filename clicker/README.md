# clicker

##### Chart for bringing up the clicker webpage
Test template:  
```
helm template --dry-run click ./clicker/ --values ./clicker/values.yaml --set image.tag={{image-tag}} --set namespace=default
```
Install command:  
```
helm install click ./clicker/ --values ./clicker/values.yaml --set image.tag=b73c409e6c241d71de7b1b7c17977a86182761a0 --set --set namespace=default
```