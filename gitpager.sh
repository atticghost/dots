#!/bin/bash

stdin=$(cat /dev/stdin)
lines=$(echo "$stdin" | wc -l)
LINES=$(tput lines)

if [ "$lines" -lt "$LINES" ] ; then
	echo "$stdin"
else
	echo "$stdin" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | /bin/bash -c "vim -c 'silent! set ft=mygit ts=8 cc=0 nomod nolist nu rnu noma' -c 'noremap q <Esc>:q!<Return>' -c 'unmap q:'</dev/tty <(col -b)"
fi
