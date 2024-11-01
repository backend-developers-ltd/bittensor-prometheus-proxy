terraform {
  backend "s3" {
    bucket = "bittensor-prometheus-proxy-xeokrb"
    key    = "staging/main.tfstate"
    region = "us-east-1"
  }
}
