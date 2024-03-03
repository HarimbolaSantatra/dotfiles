#!/usr/bin/env bash
# Copyright (c) .NET Foundation and contributors. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.

version="8.0"
sudo apt-get update && \
           sudo apt-get install -y dotnet-sdk-$version
