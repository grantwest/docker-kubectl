FROM alpine:latest
ARG KUBECTL_VERSION

RUN apk add --no-cache envsubst
RUN curl -LO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    curl -LO "https://dl.k8s.io/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check && \
    chmod 755 kubectl && \
    mv kubectl /bin/ && \
    rm -f kubectl.sha256
