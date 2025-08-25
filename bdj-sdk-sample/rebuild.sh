#!/bin/bash

if [ -z "${PS4_PAYLOAD_SDK:-}" ]; then 
    export PS4_PAYLOAD_SDK=/opt/ps4-payload-sdk
fi

if [ -z "${BDJSDK_HOME:-}" ]; then 
    export BDJSDK_HOME="$(realpath ../../bdj-sdk)"
fi

rm -rf src
cp -r ../src src

mkdir -p payloads
rm -rf payloads/lapse
cp -r ../payloads/lapse payloads/lapse

make -C payloads/lapse/src/org/bdj/external clean; make -C payloads/lapse/src/org/bdj/external

make clean; make

make -C payloads/lapse clean; make -C payloads/lapse

cp payloads/lapse/Lapse.jar src/org/bdj/payload.jar

make clean; make