#!/bin/bash
rm -rf /usr/local/go
curl -Lo install_hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-amd64.deb
sudo apt-get install ./install_hugo.deb
# apt-get update && apt-get install -y hugo make
# apt-get install curl -y 
# curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-amd64.deb -o last.deb
# apt-get install ./last.deb
# npm install -g markdownlint-cli
# rm last.deb