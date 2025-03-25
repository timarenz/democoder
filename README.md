# DemoCoder

A containerized development environment using Visual Studio Code (code-server).

The following extension are pre-installed and pre-configured
- [WizCode](https://marketplace.visualstudio.com/items?itemName=WizCloud.wiz-vscode)
- [HashiCorp Terraform](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

It uses [socat to access the local Docker socket](https://qmacro.org/blog/posts/2023/12/22/using-the-docker-cli-in-a-container-on-macos/), as direct access (with a container running a non-root users) is quite finicky.

## Requirements

- Docker
- Docker Compose

## Usage

1. Clone this repository
2. Run the following command to start the environment:

```bash
docker compose up
```

3. Access the development environment at http://localhost:8080

By default a empty folder called `repo` is opened within the environment. To map your own repo configure a volume mapping from your local repo of choice to the location `/home/coder/repo` within the container.

```yaml
services:
  coder:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    volumes:
      - /path/to/a/repo:/home/coder/repo
[...]
```

## Disclaimer

**This project is provided as-is without any guarantees.** The authors make no warranties regarding the functionality, reliability, or suitability for any purpose. Use at your own risk.