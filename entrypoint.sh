#!/bin/sh -l

files=$1

svlint --version

for filelist in $2
do
    filelists="$filelists -f $filelist"
done

svlint --github-actions $files $filelists
