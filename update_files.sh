#!/bin/sh
set -x

BASE_URL=https://config.dencun-devnet-10.ethpandaops.io

curl -s $BASE_URL/cl/config.yaml > cl_config/config.yaml
curl -s $BASE_URL/api/v1/nodes/inventory | jq -r '.ethereum_pairs[] | .consensus.enr' | sed 's/^/- /' > cl_config/boot_enr.yaml
curl -s $BASE_URL/cl/genesis.ssz > cl_config/genesis.ssz

curl -s $BASE_URL/el/genesis.json > geth/genesis.json
