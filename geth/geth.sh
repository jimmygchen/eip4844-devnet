#!/bin/sh

geth init  --datadir /db /config/genesis.json

bootnodes=$(curl -s https://config.dencun-devnet-9.ethpandaops.io/api/v1/nodes/inventory | jq -r '[ .ethereum_pairs[] | .execution.enode ] | join(",")'  | tr -d '"')
network_id=$(jq -r '.config.chainId' /config/genesis.json)

exec geth \
  --datadir /db \
  --networkid "$network_id" \
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
