#!/bin/sh

boot_nodes=$(curl -s https://config.4844-devnet-7.ethpandaops.io/api/v1/nodes/inventory | jq '[ .ethereum_pairs[] | .consensus.enr ] | join(",")' | tr -d '"')

if [ -n "${CHECKPOINT_SYNC_URL}" ]; then
  checkpoint_sync="--checkpoint-sync-url=${CHECKPOINT_SYNC_URL}"
else
  checkpoint_sync=""
fi

exec lighthouse bn \
  --datadir /data \
  --execution-jwt /config/jwtsecret \
  --execution-endpoint http://geth:8551 \
  --self-limiter=blob_sidecars_by_range:512/10 \
  --debug-level ${CL_LOG_LEVEL:-info} \
  --testnet-dir /config/testnet \
  --http \
  --http-address=0.0.0.0 \
  --metrics \
  --metrics-address=0.0.0.0 \
  --port ${CL_P2P_PORT:-9000} \
  --boot-nodes "$boot_nodes" ${checkpoint_sync}