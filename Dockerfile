FROM python:3-alpine3.8
RUN apk --update --no-cache add bash curl git ssh make gcc g++
ENV SHELL=/bin/bash
RUN pip install --upgrade pip setuptools awscli
RUN rm -r /root/.cache

RUN mkdir .kube
RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl
RUN curl -O -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.5.5/kustomize_v3.5.5_linux_amd64.tar.gz
RUN tar -zxvf kustomize_v3.5.5_linux_amd64.tar.gz

RUN chmod +x ./kubectl
RUN chmod +x ./kustomize
RUN cp ./kubectl /bin/kubectl && export PATH=$HOME/bin:$PATH
RUN cp ./kustomize /bin/kustomize
