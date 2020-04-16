#!/bin/bash
#
# check if the hsh shell handle the arguments
command="   ls -l -a"
tmp_file="test_sh_arguments"
tmp_file2="test_hsh_arguments"
# create a pseudo random file
touch $tmp_file
# send commands
echo "$command" | ./hsh > $tmp_file 2> /dev/null &
let tmp_exit=`echo $?`
# wait a little bit
$SLEEP $SLEEPSECONDS
# check the result
nmatch=`grep -c "$output_shell" "$output_sh"`
if [ $nmatch -eq 0 ]; then
       echo "Test passed"
else
       echo "Test not worked"
fi
# clean up
stop_shell
rm -f $tmp_file
rm -f $tmp_file2
