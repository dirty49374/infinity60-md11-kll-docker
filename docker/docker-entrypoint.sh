#!/bin/bash
set -e

cd /controller

case $1 in
	sh)
		cp /kiibohd/*.bash Keyboards
		cp /kiibohd/*.kll kll/layouts
		cd Keyboards
		exec /bin/bash
		;;
	*)
		cp /kiibohd/*.bash Keyboards
		cp /kiibohd/*.kll kll/layouts
		cd Keyboards
		
		echo "* removing old..."
		! rm -rf /kiibohd/output/*

		echo "* compiling..."
		! ./$1.bash

		echo "* copying new..."
		for _dir in *; do
			[ -d "${_dir}" ] && [ "${_dir}" != "Testing" ] && cp -rf "${_dir}" "/kiibohd/output/${_dir}"
		done
		echo "* done"
		;;
esac
