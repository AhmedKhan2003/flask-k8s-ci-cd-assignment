\## Final Integration \& How to Run



\### Run locally

$ python -m venv venv

$ . venv/Scripts/activate

$ pip install -r requirements.txt

$ python app.py



\### Tests

$ pytest -q



\### Minikube deployment

$ minikube start --driver=docker

$ kubectl apply -f kubernetes/deployment.yaml

$ kubectl apply -f kubernetes/service.yaml

$ minikube service flask-service



\### Jenkins pipeline

Jenkinsfile in repo root builds and pushes Docker image, then updates the Kubernetes deployment with the new image tag.



