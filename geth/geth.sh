#!/bin/sh

geth init  --datadir /db /config/genesis.json

bootnodes=$(curl -s https://config.4844-devnet-7.ethpandaops.io/api/v1/nodes/inventory | jq -r '[ .ethereum_pairs[] | .execution.enode ] | join(",")'  | tr -d '"')

exec geth \
  --datadir /db \
  --networkid 7011893056 \
  --syncmode=full \
  --verbosity ${EL_LOG_LEVL:-3} \
  --authrpc.jwtsecret /config/jwtsecret \
  --http \
  --http.addr=0.0.0.0 \
  --http.vhosts=* \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --port=${EL_P2P_PORT:-30303} \
  --bootnodes "$bootnodes"
