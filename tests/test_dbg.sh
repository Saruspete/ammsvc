#!/usr/bin/env bash

set -o nounset
set -o noclobber


function log_dbg {
	while read text; do 
		echo "[DBG][$(date +%H:%M:%S)] $text"
	done
}

# Debugging logs (beware, will be async from other standard log_ calls !)
exec 99> >(log_dbg -; wait)
export PS4=' (${BASH_SOURCE##*/}::${FUNCNAME[0]}::$LINENO) '
BASH_XTRACEFD=99


echo adrien > /dev/null
set -x
echo coucou > /dev/null
date
set +x
