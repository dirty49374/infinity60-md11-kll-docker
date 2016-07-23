#!/bin/bash
docker run -v /$(pwd)/kiibohd:/kiibohd --rm -i -t dirty49374/infinity60-md11-kll-docker $*
