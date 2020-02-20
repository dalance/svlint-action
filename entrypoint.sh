#!/bin/sh -l

files=$1
filelists=$2

svlint --version

echo $file
echo $filelists

echo "::error file=test.sv,line=3,col=5::`case` must have `default` in `always_comb` or `function`"
