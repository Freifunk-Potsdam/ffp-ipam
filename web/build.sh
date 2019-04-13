#! /usr/bin/env bash

mkdir -p ./build/register

pandoc -o ./build/index.html index.md

elm make ./src/register.elm --output=./build/register/index.html
