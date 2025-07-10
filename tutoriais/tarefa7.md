

```bash

gcloud container clusters create esr-lab --zone us-central1-c --num-nodes 2

gloud services enable file.googleapis.com

gloud filestore instances describe filestore-instance --zone=us-central1-c --format="value(networks.ipAddresses)"


kubectl apply -k "github.com/kubernetes-csi/csi-driver-nfs/deploy/kubernetes/overlays/stable" #instalar NFS driver no cluster kubernetes

kubectl apply -f sc-nfs.yaml
kubectl apply -f events.yaml
kubectl apply -f author.yaml



```
