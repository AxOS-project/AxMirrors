#!/bin/bash

rm axos-testing.db*
rm axos-testing.file*

echo "repo-add"
repo-add -n -R axos-testing.db.tar.gz *.pkg.tar.zst
# mv axos.db.tar.gz axos.db
# mv axos.file.tar.gz axos.file


echo "####################################"
echo "#	    Repo Updated! Goodbye!	 #"
echo "####################################"
