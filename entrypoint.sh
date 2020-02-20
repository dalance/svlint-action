#!/bin/sh -l

files=$1
filelists=$2

svlint --version

echo $file
echo $filelists

time=$(date)
echo ::set-output name=time::$time
