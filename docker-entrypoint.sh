#!/bin/bash
set -e

cd /controller
pwd
ls -l
case $1 in
	sh)
		cp /kiibohd/*.bash Keyboards
		cp /kiibohd/*.kll kll/layouts
		cd Keyboards
		exec /bin/bash
		;;
	get)
		cp Keyboards/MD1.1-Standard.bash /kiibohd
		;;
	*)
		cp /kiibohd/*.bash Keyboards
		cp /kiibohd/*.kll kll/layouts
		cd Keyboards
		echo "compiling..."
		! ./$1
		echo "removing old..."
		! rm -rf /kiibohd/output/*
		echo "copying new..."
		cp -rf MD11_STANDARD.gcc/* /kiibohd/output
		echo "done"
		;;
esac
