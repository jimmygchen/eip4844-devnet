#!/bin/sh

geth init  --datadir /db /config/genesis.json

exec geth \
  --datadir /db \
  --networkid 4844001005 \
  --syncmode=full \
  --verbosity 4 \
  --authrpc.jwtsecret /config/jwtsecret \
  --authrpc.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --bootnodes "enode://2c697b4ee37a63ee5b5663511121125574a12eaf306ac9f532e4a163729157cbff7ea155eabde89dcc877aae476ad4f8e2f20192d05de9115053d839d958f073@188.166.69.205:30303,enode://e349436a6cb618c0d10c25b120eddbab8d7b1f2ffb176fb17e534e79f4e24092fccf42077c1d72e7244f342c7147b325417ef00a637f478bd1426ad38fe99e81@159.223.217.81:30303"
