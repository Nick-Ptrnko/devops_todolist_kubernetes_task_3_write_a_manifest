# Instructions for TodoApp Infrastructure

### 1. How to apply manifests
Run the following commands from the root of the repository:
```
kubectl apply -f .infrastructure/namespace.yml
kubectl apply -f .infrastructure/todoapp-pod.yml
kubectl apply -f .infrastructure/busybox.yml
````
### 2. How to test using port-forward
To access the application from your local machine (browser/curl):
```
kubectl port-forward pod/todoapp 8000:8000 -n todoapp
```
Then open: http://localhost:8000/
After that, verify the operability:
- **Main page:** http://localhost:8000/
- **Liveness:** http://localhost:8000/api/health/live/
- **Readiness:** http://localhost:8000/api/health/ready/
### 3. How to test using busyboxplus:curl
Since Services are not being used, first find the internal IP address of the `todoapp` pod:
```
kubectl get pod todoapp -n todoapp -o wide
```
Find the value in the **IP** column (e.g., `10.244.0.5`).
Execute a request from the `busybox` container (replace `<POD_IP>` with the actual address obtained above):
```
kubectl exec -it busybox -n todoapp -- curl http://<POD_IP>:8000/api/health/live/
```
