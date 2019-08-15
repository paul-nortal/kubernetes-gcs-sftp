PROJECT_ID=paul-kube

image:
	docker build -t gcr.io/${PROJECT_ID}/sftp .
	docker push gcr.io/${PROJECT_ID}/sftp

up:
	kubectl create namespace sftp
	kubens sftp
	kubectl create secret generic users --from-file=users.conf=./etc/sftp/users.conf
	kubectl create secret generic sftp-gcloud-key --from-file=gcloud-key.json=./secrets/gcloud-key.json 
	kubectl create configmap gcs-mounts --from-file=gcs-mounts.sh=./etc/sftp.d/gcs-mounts.sh 
	kubectl apply -f sftp.yaml
	
down:
	kubens sftp
	kubectl delete service sftp-front
	kubectl delete deployment sftp-deployment
	kubectl delete secret users
	kubectl delete secret sftp-gcloud-key
	kubectl delete configmap gcs-mounts
	kubectl delete namespace sftp
