FROM python:3-alpine3.13
RUN apk --update --no-cache add bash curl git busybox jq openssh-client make gcc g++
ENV SHELL=/bin/bash
RUN pip install --upgrade pip setuptools awscli
RUN rm -r /root/.cache

RUN mkdir .kube
RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
RUN curl -O -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.0.1/kustomize_v4.0.1_linux_amd64.tar.gz
RUN curl -O -L https://github.com/argoproj/argo-rollouts/releases/download/v0.10.2/kubectl-argo-rollouts-linux-amd64

RUN tar -zxvf kustomize_v4.0.1_linux_amd64.tar.gz

RUN chmod +x ./kubectl
RUN chmod +x ./kustomize
RUN chmod +x ./kubectl-argo-rollouts-linux-amd64
RUN cp ./kubectl /bin/kubectl && export PATH=$HOME/bin:$PATH
RUN cp ./kustomize /bin/kustomize
RUN cp ./kubectl-argo-rollouts-linux-amd64 /bin/kubectl-argo-rollouts-linux-amd64
