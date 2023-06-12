#!/bin/bash

docker build -f Dockerfile.multistage -t my_maven .


docker run -it my_maven bash

#docker build -t my_multi_stage_maven -f Dockerfile.multistage .
#docker run -it my_multi_stage_maven bash
