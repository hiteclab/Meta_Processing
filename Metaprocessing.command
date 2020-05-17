#!/bin/bash
cd -- "$(dirname "$BASH_SOURCE")"
$PWD/processing-java --sketch=$PWD/MetaProcessing/ --force --run
