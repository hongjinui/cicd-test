#!/bin/bash

sleep 3 | echo Sleeping

mongo mongodb://mongors1:27017 /usr/src/configs/replicaSet.js

