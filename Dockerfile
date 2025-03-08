FROM amazon/aws-cli:latest

LABEL org.opencontainers.image.title="AWS CLI with SSM Plugin"
LABEL org.opencontainers.image.description="The AWS CLI with pre-installed AWS Session Manager plugin"
LABEL org.opencontainers.image.source="https://github.com/getprobo/docker-aws-cli-with-ssm-plugin"
LABEL org.opencontainers.image.licenses="MIT"

ENV SSM_BASE_URL="https://s3.amazonaws.com/session-manager-downloads/plugin/latest"

RUN <<EOF
set -e

yum update -y

ARCH=$(uname -m)

if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    ARCH_PATH="linux_arm64"
elif [ "$ARCH" = "x86_64" ]; then
    ARCH_PATH="linux_64bit"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

yum install -y "${SSM_BASE_URL}/${ARCH_PATH}/session-manager-plugin.rpm"
yum clean all
EOF

WORKDIR /aws
ENTRYPOINT ["/usr/local/bin/aws"]
