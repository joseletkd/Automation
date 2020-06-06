#!/bin/bash
echo "Enter username"
read a
echo "Enter login type 1. WHM 2. cPanel"
read t
if [ $t -eq 1 ] ; then
	whmapi1 create_user_session user=$a service=whostmgrd
elif [ $t -eq 2 ] ; then
	whmapi1 create_user_session user=$a service=cpaneld
else
	echo "Inavlid"
	exit 0 
fi