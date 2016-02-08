#!/bin/bash

python main.py $1 | diff $1 -
