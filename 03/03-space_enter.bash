#!/bin/bash
#
# check if the hsh shell generates a perfect new line
command="  "
tmp_file_hsh="test_sh_arguments"
tmp_file2_sh="test_hsh_arguments"
# create a pseudo random file
touch $tmp_file_hsh
touch $tmp_file2_sh
# send commands to hsh
echo "$command" | ./hsh > $tmp_file_hsh 2> /dev/null &
let tmp_exit=`echo $?`
# wait a bit
$SLEEP $SLEEPSECONDS
# checking, and comparing hsh and sh
nmatch=`grep -c "$tmp_file_hsh" "$tmp_file2_sh"`
if [ $nmatch -eq 0 ]; then
       echo "Test passed"
else
       echo "Test Failed"
fi
# clean up
stop_shell
rm -f $tmp_file
rm -f $tmp_file2
