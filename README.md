# Running a node (Lighthouse/Geth) on EIP-4844 devnet-5

Docker Compose setup for running a Lighthouse/Geth node on devnet v5. Builds docker images from `eip4844` branches of Lighthouse and Geth.

## Run with Docker

```
docker-compose up
```

To rebuild images from latest geth & lighthouse repos:

```
docker-compose build --no-cache
```

## References 

- [4844-devnet-5](https://4844-devnet-5.ethpandaops.io/)
