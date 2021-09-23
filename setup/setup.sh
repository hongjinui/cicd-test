#!/bin/bash

sleep 3 | echo Sleeping

mongo mongodb://mongoRs1:27017 replicaSet.js

