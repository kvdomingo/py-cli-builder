#!/bin/sh

poetry export -f requirements.txt --dev --without-hashes | pip install -r /dev/stdin
pyinstaller -F --clean --name "$NAME" setup.py
