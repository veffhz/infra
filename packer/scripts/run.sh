#!/bin/bash

source ~/.rvm/scripts/rvm

puma -b tcp://0.0.0.0:9292 -S log.puma.txt
