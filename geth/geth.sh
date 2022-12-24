#!/bin/sh

geth init  --datadir /db /config/genesis.json

exec geth \
  --datadir /db \
  --networkid 1331 \
  --syncmode=full \
  --verbosity 4 \
  --authrpc.jwtsecret /config/jwtsecret \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --bootnodes "enode://fdefa8b36717bd246ce338e952a3b949e608158d06c74c8b9e207439f70bfc63da27b7a4c4161a14722f7d4a256fda9c93a6dd5c26624b6a523dca2cd852ad97@34.121.33.53:30303"
