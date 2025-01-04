Here lie the tools to build an image that runs prometheus but before starting reads the hotkey of a configured (
via env vars) bittensor wallet and allows for including that hotkey in prometheus' config.


To run it, you need to provide a template of the prometheus config (only the hotkey part is meant to substituted when
materializing this template), mount your wallet and specify it using env vars. for example:

config:

```yaml
global:
  scrape_interval: 5s
  evaluation_interval: 5s

scrape_configs:
  - job_name: "node"
    scrape_interval: 5s
    static_configs:
      - targets: ['host.docker.internal:9100']
        labels:
          hotkey: '{hotkey}'  # the 'template engine' in use is python's str.format()

```

running:

docker run \
  -v config.yml:/etc/prometheus/prometheus.yml.template \
  -v /home/user/.bittensor/wallets/:/wallets/ \
  -e BITTENSOR_WALLET_NAME=validator \
  -e BITTENSOR_WALLET_HOTKEY_NAME=default \
  backenddevelopersltd/bittensor_prometheus
