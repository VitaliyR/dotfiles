#!/bin/bash

# Pack everything is needed before sharing/comitting

brew list > brew.txt

# NPM config
sed '/registry/d' ~/.npmrc > .npmrc
