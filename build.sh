#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

docker build --network host -t registry.cn-hangzhou.aliyuncs.com/stone-wlg/vcluster-generic-crd-sync-plugin:v0.0.1-beta.3 .