#!/usr/bin/env ash

function prepareDatadir {
  datadir=$1
  etherbase=$2
  if [ ! -d $datadir/geth ]; then
    echo "----------> A new data directory will be created!"
    geth --datadir $datadir \
         --networkid "101010" \
         init genesis.json
  fi
}
