#docker build -t ayfantis53/multi-client-k8s:latest -t ayfantis53/multi-client-k8s:$SHA -f ./client/Dockerfile ./client
#docker build -t ayfantis53/multi-server-k8s-pgfix:latest -t ayfantis53/multi-server-k8s-pgfix:$SHA -f ./server/Dockerfile ./server
#docker build -t ayfantis53/multi-worker-k8s:latest -t ayfantis53/multi-worker-k8s:$SHA -f ./worker/Dockerfile ./worker

#docker push ayfantis53/multi-client-k8s:latest
#docker push ayfantis53/multi-server-k8s-pgfix:latest
#docker push ayfantis53/multi-worker-k8s:latest

#docker push ayfantis53/multi-client-k8s:$SHA
#docker push ayfantis53/multi-server-k8s-pgfix:$SHA
#docker push ayfantis53/multi-worker-k8s:$SHA

echo "starting"
aws eks --region us-east-2 describe-cluster --name eks-cluster --query cluster.status

aws sts get-caller-identity
aws eks update-kubeconfig --name eks-cluster-name --region us-east-2 --role-arn arn:aws:iam::XXXXXXXXXXXX:role/testrole
kubectl get svc

echo "applying k8 files"
kubectl apply -f ./k8s/

#kubectl set image deployments/server-deployment server=ayfantis53/multi-server-k8s-pgfix:$SHA
#kubectl set image deployments/client-deployment client=ayfantis53/multi-client-k8s:$SHA
#kubectl set image deployments/worker-deployment worker=ayfantis53/multi-worker-k8s:$SHA

echo "done"