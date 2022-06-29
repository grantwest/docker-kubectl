FROM alpine:latest
ARG KUBECTL_VERSION

RUN apk add --no-cache curl gettext
RUN curl -sSLO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    curl -sSLO "https://dl.k8s.io/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c && \
    chmod 755 kubectl && \
    mv kubectl /bin/ && \
    rm -f kubectl.sha256
