#!/bin/bash

sleep 3 | echo Sleeping

mongo mongodb://localhost:27017 /usr/src/configs/replicaSet.js

