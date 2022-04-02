Kube deployment
=======

Deploy docker image to Kubernetes  

Installation
=======
Install kubectl and ninikube on your system and create account on DockerHub  

Steps
=======
* * 1. Log in DockerHub:  


$ docker login --username < your_username > --password < your_password>  



* * 2. Push image you created before to DockerHub:  


$docker images &emsp;&emsp;&emsp; #get image repository, id and tag  

$docker tag < image_id > < your_username >/< image_repository >:< image_tag > &emsp; #tag image  

$docker push < your_username >/< image_repository &emsp;&emsp; #push image to DockerHub  


* * 3. Create a secret:  


In credentials.txt write your google_client_id and google_client_secret  

$ kubectl create secret generic creds --from-env-file ./credentials.txt  


* * 4. Create a deployment with port 5000:  


$ kubectl apply -f ./my_deployment.yaml  


* * 5. Run port-forwarding on your computer:  


$ kubectl get pods &emsp;&emsp; #check if pods is ready  

$ kubectl port-forward deployment/flask-app < port >:5000  



To see the result open localhost: < port >
