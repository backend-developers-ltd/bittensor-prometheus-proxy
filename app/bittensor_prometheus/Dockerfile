# Use Python base image from DockerHub
FROM python:3.11

RUN pip install bittensor==8.2.0

WORKDIR /app

RUN apt-get update && \
    apt-get install -y wget curl && \
    wget https://github.com/prometheus/prometheus/releases/download/v2.55.0/prometheus-2.55.0.linux-amd64.tar.gz && \
    tar xvzf prometheus-*.tar.gz && \
    mkdir /etc/prometheus && \
    mv prometheus-2.55.0.linux-amd64/prometheus /bin/ && \
    mv prometheus-2.55.0.linux-amd64/promtool /bin/ && \
    mv prometheus-2.55.0.linux-amd64/prometheus.yml /etc/prometheus/ && \
    rm -rf prometheus-*.tar.gz prometheus-2.55.0.linux-amd64 && \
    chown -R nobody:nogroup /etc/prometheus && \
    chown -R nobody:nogroup /etc/prometheus

RUN chown nobody: /etc/prometheus

COPY read_wallet_and_substitute_config.py /app/
RUN chown -R nobody: /app/

COPY entrypoint.sh /
RUN chown nobody: /entrypoint.sh

RUN mkdir /nonexistent
RUN chown nobody: /nonexistent

RUN mkdir /wallets
RUN chown nobody: /wallets

#USER nobody

ENTRYPOINT ["/entrypoint.sh"]