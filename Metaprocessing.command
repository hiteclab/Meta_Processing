#!/bin/bash
cd -- "$(dirname "$BASH_SOURCE")"
sh processing-java --sketch="$PWD"/MetaProcessing/ --force --run
