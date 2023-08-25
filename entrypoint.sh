#!/bin/sh -l

svlint --version
printf 'SVLINT_CONFIG=%s\n' ${SVLINT_CONFIG}

files=$1

for filelist in $2
do
    filelists="$filelists -f $filelist"
done

ruleset=$3
if [ -z "$3" ]
then
  svlint="svlint"
else
  svlint="svlint-$ruleset"
fi

$svlint --github-actions $files $filelists
