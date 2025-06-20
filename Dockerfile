FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN bash -c "$(curl -s https://linux.pufferpanel.com/install-node.sh)"

EXPOSE 5657

CMD ["/usr/sbin/pufferpanel", "run"]
