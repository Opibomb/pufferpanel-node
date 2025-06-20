FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    gnupg \
    ca-certificates \
    net-tools \
    iproute2 \
    systemd \
    && rm -rf /var/lib/apt/lists/*

# Install PufferPanel Node
RUN curl -s https://linux.pufferpanel.com/install-node.sh | bash

# Create a simple entrypoint to start the node
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 5657

CMD ["/entrypoint.sh"]
