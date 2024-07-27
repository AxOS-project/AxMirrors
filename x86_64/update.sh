#!/bin/bash

rm axos.db*
rm axos.file*

echo "repo-add"
repo-add -n -R axos.db.tar.gz *.pkg.tar.zst
mv axos.db.tar.gz axos.db
mv axos.file.tar.gz axos.file


echo "####################################"
echo "#	    Repo Updated! Goodbye!	 #"
echo "####################################"
