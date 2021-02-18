#!/bin/bash

workspace="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

cd $workspace
./up.sh && make menuconfig

