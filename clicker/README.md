# clicker

##### Chart for bringing up the clicker webpage

Install command:  
```
helm install click ./clicker/ --values ./clicker/values.yaml --set image.tag={{image-tag}} --set ingress.hosts[0].host=clicker.control.clickthebutton.click
```