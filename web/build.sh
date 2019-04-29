#! /usr/bin/env bash

mkdir -p ./build/register

pandoc -o ./build/index.html ./markdown/index.md

elm make ./src/register.elm --debug --output=./build/register/index.html
