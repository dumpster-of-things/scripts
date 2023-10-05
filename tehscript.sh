#!/usr/bin/env bash

### Throw however many directories you'd like to check at this script (even if they themselves have spaces in their path (provided they are quoted))
##  Example:
#         `   ./tehscript.sh /home/biden /opt "/home/other biden"   `



# if ran without arguments, re-runs itself with your current directory as $1
(($#!=0)) || { ${0} "$PWD" ; exit $? ; }



That='https://raw.githubusercontent.com/browser-history/browser-history/master/browser_history/browsers.py'


# while looping over some lines parsed from "$That"
#   (assuming said parsing returns some PATH(s) to look for)
while read line ; do
	#
	# for any of them things you done said(: $@ ) that are directories
	for ((a=1;a<=$#;a++)); do [[ -d "${!a}" ]] || continue
		#
		# say something if any of'm have said PATH(s) in there
 	 	[[ ! -e "${!a}/$line" ]] || echo "${!a}/$line"
 	 	#
 	 	# otherwise, do nothing.
	done
done < <(curl -s "$That" | grep 'path = ' | cut -d\" -f2 2>/dev/null )

# curl ... | grep ... | cut -d\" -f2 | sed 's/ /\\ /g'
