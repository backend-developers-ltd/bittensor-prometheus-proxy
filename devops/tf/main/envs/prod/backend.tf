terraform {
  backend "s3" {
    bucket = "bittensor-prometheus-proxy-xeokrb"
    key    = "prod/main.tfstate"
    region = "us-east-1"
  }
}
