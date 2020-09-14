#!/bin/bash

set -euxo pipefail

###############################################################################
## name		: gpgmulti.sh (original by Nick Montpetit)
## purpose	: symmetrically encrypts/decrypts multiple files using GnuPG
## usage	: gpgmulti.sh [-c] file_pattern
###############################################################################

# encrypt all non-gpg files recursively:
# find . -type f -not -name .DS_Store -not -name "*.gpg" -print0 | xargs -0 -o gpgmulti.sh -c

# decrypt all gpg files recursively:
# find . -type f -name "*.gpg" -print0 | xargs -0 -o gpgmulti.sh

if [ "$1" = "-e" ]
then
	shift

	for file in "$@"
	do
		extension=${file##*.}

		if [ "$extension" != "gpg" ]
		then
			gpg_name=$file.gpg

			echo "gpg -c:" $file "->" $gpg_name
			gpg -r onlyusefororg@example.com -e -o "$gpg_name" "$file"
			rm $file
		fi
	done
else
	for file in "$@"
	do
		extension=${file##*.}

		if [ "$extension" = "gpg" ]
		then
			original_name=${file%.*}

			echo "gpg:" $file "->" $original_name
			gpg -d "$file" > $original_name
			rm "$file"
		fi
	done
fi
