#!/bin/bash

set -e

BIN="/usr/local/bin/snell-server"
CNF="/etc/snell-server.conf"
PRT="9102"
PSK=""

while [ $# -gt 0 ]; do
    case "$1" in
    --psk)
        PSK="$2"
        shift 2
        ;;
    --port)
        PRT="$2"
        shift 2
        ;;
    *)
        echo "Unknown argument: $1"
        exit 1
        ;;
    esac
done

if [ -z ${PSK} ]; then
    PSK=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16)
    echo "Using generated PSK: ${PSK}"
else
    echo "Using predefined PSK: ${PSK}"
fi

if [ -f ${CNF} ]; then
    echo "Deleting existed ${CNF}"
    rm -f ${CNF}
fi

echo "[snell-server]" >> ${CNF}
echo "listen = 0.0.0.0:${PRT}" >> ${CNF}
echo "psk = ${PSK}" >> ${CNF}
echo "Running snell-server with config:"
echo ""
cat ${CNF}

${BIN} --version
${BIN} -c ${CNF}
