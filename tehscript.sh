#!/usr/bin/env bash

### Throw however many directories you'd like to check at this script (even if they themselves have spaces in their path (provided they are quoted))
### Example:
###         `   ./tehscript.sh /home/biden /opt "/home/other biden"   `

### if ran without arguments, reruns itself with your current directory as $1
(($#!=0)) || { ${0} "${PWD}" ; exit $? ; }


That='https://raw.githubusercontent.com/browser-history/browser-history/master/browser_history/browsers.py'

while read line ; do
	for ((a=1;a<=$#;a++)); do [[ -d "${!a}" ]] || continue
 	 	[[ ! -e "${!a}/$line" ]] || echo "${!a}/$line"
	done
done < <(curl -s "$That" | grep 'path = ' | cut -d\" -f2 2>/dev/null )

# curl ... | grep ... | cut -d\" -f2 | sed 's/ /\\ /g'
