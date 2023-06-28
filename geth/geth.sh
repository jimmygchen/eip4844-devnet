#!/bin/sh

geth init  --datadir /db /config/genesis.json

bootnodes=$(curl -s https://config.4844-devnet-6.ethpandaops.io/api/v1/nodes/inventory | jq -r '[ .ethereum_pairs[] | .execution.enode ] | join(",")'  | tr -d '"')

exec geth \
  --datadir /db \
  --networkid 7011893055 \
  --syncmode=full \
  --verbosity 4 \
  --authrpc.jwtsecret /config/jwtsecret \
  --http \
  --http.addr=0.0.0.0 \
  --http.vhosts=* \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --port=${EL_P2P_PORT:-30303} \
  --bootnodes "$bootnodes"
