#!/bin/bash
#
# check that the program ls -la is found putting three  tabs before ls and three tabs for -la
# check also that displays the list in long format and  hidden files

command="                       ls                      -la"
tmp_file="testing_tmp_file_$RANDOM"

# create a pseudo random file
touch $tmp_file
# run command
echo "$command" | $HSHELL > $OUTPUTFILE 2> /dev/null &

# wait a little bit
$SLEEP $SLEEPSECONDS

# check the result
nmatch=`cat $OUTPUTFILE | grep -c "$tmp_file"`
# check the results
if [ $nmatch -eq 1 ]; then
		print_ok
else
		print_ko
fi

# clean up
stop_shell
rm -f $tmp_file
