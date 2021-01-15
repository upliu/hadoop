#!/bin/bash

schematool -initSchema -dbType mysql
hive --service metastore
