#!/bin/sh

geth init  --datadir /db /config/genesis.json

bootnodes=$(cat /config/enodes.list)
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
