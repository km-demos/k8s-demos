FROM ghcr.io/actions/actions-runner:2.310.2

USER root

RUN apt-get update \
  apt-get install -y curl \
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
  chmod 700 get_helm.sh \
  ./get_helm.sh

USER runner