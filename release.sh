#!/bin/bash

set -xe

if [ ! $(command -v github-release) ]; then
  go get github.com/aktau/github-release
fi

if [ ! $GITHUB_TOKEN ]; then
  echo 'Invalid GITHUB_TOKEN value! Set it up!'
  exit 1
fi

github-release release \
    --user gideao \
    --repo squid \
    --tag v3.5.27 \
    --name "v3.5.27" \
    --pre-release

for f in `ls *.deb`; do
  github-release upload \
      --user gideao \
      --repo squid \
      --tag v3.5.27 \
      --name "$f" \
      --file $f
done
