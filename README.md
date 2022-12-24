# Running a node (Lighthouse/Geth) on EIP-4844 devnet-3

- [EIP-4844 devnet-3 Spec & Tracker
](https://notes.ethereum.org/@timbeiko/4844-devnet-3)
- [Devnet v3 Guide](https://hackmd.io/@inphi/Hk_cLBJFo)

## Install & Run Geth

- Go >= 1.18 installed

```
git clone git@github.com:mdehoog/go-ethereum.git
cd go-ethereum
git checkout eip-4844
make geth
```

Make sure `geth` is on the `$PATH` (or use full path to binary), and then run from this project's root directory:

```
geth init  --datadir geth_data/ genesis.json

geth --datadir geth_data/ --networkid 1331 --syncmode=full --verbosity 4 --bootnodes "enode://fdefa8b36717bd246ce338e952a3b949e608158d06c74c8b9e207439f70bfc63da27b7a4c4161a14722f7d4a256fda9c93a6dd5c26624b6a523dca2cd852ad97@34.121.33.53:30303"
```

## Install & Run Lighthouse

- [Lighthouse dependencies](https://lighthouse-book.sigmaprime.io/installation-source.html#dependencies) installed
- [Rust](https://www.rust-lang.org/tools/install) >= 1.65 installed

```
git clone git@github.com:sigp/lighthouse.git
cd lighthouse
git checkout eip4844
cargo install --path lighthouse --force --locked --profile "release" 
```

Make sure `lighthouse` is on the `$PATH` (or use full path to binary), and then run from this project's root directory:

```
lighthouse bn --purge-db --network eip4844 --datadir ./lighthouse_data/ --execution-jwt ./geth_data/geth/jwtsecret --execution-endpoint http://localhost:8551 --debug-level debug --trusted-setup-file ./trusted_setup.txt --libp2p-addresses /ip4/34.121.33.53/tcp/13000/p2p/16Uiu2HAkwy4MJBLsCvmuPwrfVX9GqNiGeppshnsbn2BgKskCtRDE,/ip4/34.122.190.151/tcp/13000/p2p/16Uiu2HAmHd6WSHUEB7SrxdDR8dPVLTJqkzgPGbriej15udyQZugY,/ip4/34.123.117.254/tcp/13000/p2p/16Uiu2HAmSLVoxaR1ztHqBjezWFSvFa3HeTWPZNswfS4aMWob59L6 --http
```

Credit: @realbigsean
