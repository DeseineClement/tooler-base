#!/bin/sh

TERRAFORM_DIR="/opt/terraform/$1"

if [ ! -d "$TERRAFORM_DIR" ]; then
  mkdir -p "$TERRAFORM_DIR"
  wget https://releases.hashicorp.com/terraform/$1/terraform_$1_linux_amd64.zip -O "$TERRAFORM_DIR/terraform_$1_linux_amd64.zip"
  unzip "$TERRAFORM_DIR/terraform_$1_linux_amd64.zip" -d "$TERRAFORM_DIR"
  cp "$TERRAFORM_DIR/terraform" "/usr/local/bin/terraform$1"
  chmod +x "/usr/local/bin/terraform$1"
fi

if [ "$2" = 1 ]; then
  cp "$TERRAFORM_DIR/terraform" "/usr/local/bin/terraform"
fi