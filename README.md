# Docker AWS CLI with SSM Plugin

This Docker image extends the official
[Amazon AWS CLI](https://hub.docker.com/r/amazon/aws-cli) image by adding the
AWS Session Manager plugin. It supports multiple architectures:

- x86_64 (amd64)
- ARM64 (aarch64)

## Usage

### Pull the image

```bash
docker pull ghcr.io/getprobo/docker-aws-cli-with-ssm-plugin:latest
```

### Run AWS CLI commands

```bash
docker run --rm -it \
  -v ~/.aws:/root/.aws \
  ghcr.io/getprobo/docker-aws-cli-with-ssm-plugin:latest \
  s3 ls
```

### Start an SSM session

```bash
docker run --rm -it \
  -v ~/.aws:/root/.aws \
  ghcr.io/getprobo/docker-aws-cli-with-ssm-plugin:latest \
  ssm start-session --target i-1234567890abcdef0
```

## Building Locally

To build the image locally:

```bash
docker build -t aws-cli-with-ssm-plugin .
```

## License

This project is based on the [Amazon AWS CLI](https://github.com/aws/aws-cli)
image and the
[AWS Session Manager Plugin](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html).
