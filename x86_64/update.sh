#!/bin/bash

rm axos.db*
rm axos.file*

echo "repo-add"
repo-add -n -R axos.db.tar.gz *.pkg.tar.zst
sleep 5

echo "####################################"
echo "#	    Repo Updated! Goodbye!	 #"
echo "####################################"
