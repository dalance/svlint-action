#!/bin/sh -l

files=$1

svlint --version

for filelist in $2
do
    filelists="-f $filelist $filelists"
done

svlint $files $filelists

echo "::error file=test.sv,line=3,col=5::case must have default in always_comb or function"
