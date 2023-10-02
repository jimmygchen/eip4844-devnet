# Running a node (Lighthouse/Geth) on Dencun devnet-9

Docker Compose setup for running a Lighthouse/Geth node on Dencun devnet-9. Builds docker images from Dencun devnet-9 branches of Lighthouse and Geth.

## Run with Docker

```
docker-compose up --build
```

If you've previously used this repo to run earlier devnets, you'll need to remove old containers and volumes with the below command first:

```
docker-compose rm -v
```

To rebuild the image from the latest commits, run `docker-compose build --no-cache`, then start the containers with `docker-compose up`.

## Configuration Options

Below are configurations that can be added to the `.env` file in the project directory:

```
# Overrides the EL P2P port, default 30303
EL_P2P_PORT=30303

# Overrides the EL log level, default: 3
EL_LOG_LEVEL=4

# Overrides the CL P2P port, default: 9000
CL_P2P_PORT=9300

# Overrides the CL log level, default: info
CL_LOG_LEVEL=debug

# Add option to checkpoint sync from a remote BN
CHECKPOINT_SYNC_URL=http://host.docker.internal:5053
```

## How to test

### Request devnet-9 eth

Request some devnet eth from one of the faucets here:
https://dencun-devnet-9.ethpandaops.io/

### Sending Blobs

#### Nethermind's `SendBlobs`

Nethermind's `SendBlobs` tool can be found [here](https://github.com/NethermindEth/nethermind/tree/feature/send-blobs-tool/src/Nethermind/Nethermind.SendBlobs).

```
# Usage: docker run ghcr.io/flcl42/send-blobs:latest <rpc_url> <num_of_blobs> <private_key> <receiver-address>
# Example:
docker run ghcr.io/flcl42/send-blobs:latest http://localhost:8545 5 0x0000000000000000000000000000000000000000000000000000000000000000 0x000000000000000000000000000000000000f1c1
```

#### Blob-utils

To build `blob-utils`:

```
git clone https://github.com/Inphi/blob-utils.git
cd blob-utils
go build

# for Mac with Apple M1/M2 chips, build with these flags:
CGO_CFLAGS="-O -D__BLST_PORTABLE__" CGO_CFLAGS_ALLOW="-O -D__BLST_PORTABLE__" go build
```

To send a blob, replace `your_private_key` with your private key.

```
./blob-utils tx --rpc-url http://localhost:8545 \
    --blob-file <(echo hello) \
    --to 0x0000000000000000000000000000000000000000 \
    --private-key <your_private_key> \
    --gas-limit 210000 \
    --chain-id 7011893058 \
    --priority-gas-price 200000000 \
    --max-fee-per-blob-gas 300000000
```

### Downloading a blob via Beacon API

```
# look up by slot
curl http://localhost:5052/eth/v1/beacon/blob_sidecars/68267 | jq .
```

## References

- [dencun-devnet-9](https://dencun-devnet-9.ethpandaops.io/)
- [Devnet-9 Spec](https://notes.ethereum.org/@ethpandaops/dencun-devnet-9)
