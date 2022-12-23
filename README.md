# Running a node on EIP-4844 devnet-3

- [EIP-4844 devnet-3 Spec & Tracker
](https://notes.ethereum.org/@timbeiko/4844-devnet-3)
- [Devnet v3 Guide](https://hackmd.io/@inphi/Hk_cLBJFo)

## Install & Run Geth

```
git clone git@github.com:mdehoog/go-ethereum.git
cd go-ethereum
git checkout eip-4844
make geth
```

Make sure geth is on $PATH, and then run from this project's root directory:

```
geth init  --datadir geth_data/ genesis.json

geth --datadir geth_data/ --networkid 1331 --syncmode=full --verbosity 4 --bootnodes "enode://fdefa8b36717bd246ce338e952a3b949e608158d06c74c8b9e207439f70bfc63da27b7a4c4161a14722f7d4a256fda9c93a6dd5c26624b6a523dca2cd852ad97@34.121.33.53:30303"
```

## Install & Run Lighthouse