#!/bin/sh -l

files=$1

svlint --version

for filelist in $2
do
    filelists="-f $filelist $filelists"
done

svlint $files $filelists
