#!/usr/bin/env bash

# Checks if your shell handle the ; command separator

output_shell="testing_custom_comma_separator"
output_sh="testing_real_comma_separator"

command=";ls -l ;; ls ; ; ; ls -a ;"

# clean up
rm -f $output_shell
rm -f $output_sh

# create a pseudo random file
touch $output_shell
touch $output_sh

# send commands
echo "$command" | ./hsh > $output_shell 2> /dev/null &
echo "$command" | /bin/sh > $output_sh 2> /dev/null &

# wait a little bit -> HOMEWORK
$SLEEP $SLEEPSECONDS

# check the result
nmatch=`grep -c "$output_shell" "$output_sh"`
if [ $nmatch -eq 0 ]; then
	   echo "Test Passed"
else
	   echo "Test Failed"
fi

# clean up
rm -f $output_shell
rm -f $output_sh
pkill hsh
