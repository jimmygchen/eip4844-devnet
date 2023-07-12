# Running a node (Lighthouse/Geth) on EIP-4844 devnet-7

Docker Compose setup for running a Lighthouse/Geth node on devnet v7. Builds docker images from EIP-4844 devnet-7 branches of Lighthouse and Geth.

## Run with Docker

```
docker-compose up --build
```

If you've previously used this repo to run earlier devnets, you'll need to remove old containers and volumes with the below command first:

```
docker-compose rm -v
```

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
```

## How to test

https://hackmd.io/@jimmygchen/H1XUtBIfn

## References 

- [4844-devnet7](https://4844-devnet-7.ethpandaops.io/)
- [Devnet-7 Spec](https://notes.ethereum.org/@parithosh/devnet-7-specs)
