#!/bin/bash

rm axos*

echo "repo-add"
#repo-add -s -n -R carli_repo.db.tar.gz *.pkg.tar.zst
repo-add -n -R axos.db.tar.gz *.pkg.tar.zst
sleep 5

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
