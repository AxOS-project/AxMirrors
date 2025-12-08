#!/bin/bash

rm axos-testing.db*
rm axos-testing.file*

echo "repo-add"
repo-add -n -R axos-testing.db.tar.gz *.pkg.tar.zst
# mv axos-testing.db.tar.gz axos.db
# mv axos-testing.file.tar.gz axos.file


echo "####################################"
echo "#	    Repo Updated! Goodbye!	 #"
echo "####################################"
