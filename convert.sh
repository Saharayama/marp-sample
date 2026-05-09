#!/bin/bash

set -eu
marp main.md --theme ./user.css -o main.pdf --allow-local-files
