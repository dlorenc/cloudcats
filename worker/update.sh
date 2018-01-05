#!/bin/bash
TAG=$(date +%s)
docker build -t gcr.io/dlorenc-vmtest2/ccworker:$TAG .
gcloud docker -- push gcr.io/dlorenc-vmtest2/ccworker:$TAG
kubectl set image deployment cloudcats-worker cloudcats-worker=gcr.io/dlorenc-vmtest2/ccworker:$TAG
kubectl rollout status deployment cloudcats-worker
