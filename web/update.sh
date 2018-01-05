#!/bin/bash
TAG=$(date +%s)
docker build -t gcr.io/dlorenc-vmtest2/ccweb:$TAG .
gcloud docker -- push gcr.io/dlorenc-vmtest2/ccweb:$TAG
kubectl set image deployment cloudcats-web cloudcats-web=gcr.io/dlorenc-vmtest2/ccweb:$TAG
kubectl rollout status deployment cloudcats-web
