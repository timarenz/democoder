# DemoCoder

A containerized development environment using Visual Studio Code (code-server) pre-configured WizCode extensions. It also includes a copy of the [public-demo](https://github.com/wiz-code-demo/public-demo) repo for demo purposes.

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

## Disclaimer

**This project is provided as-is without any guarantees.** The authors make no warranties regarding the functionality, reliability, or suitability for any purpose. Use at your own risk.