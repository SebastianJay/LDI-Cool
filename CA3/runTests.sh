#!/bin/bash

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: $0 [test1] [test2] ...
If no argument given, runs on all .cl files in ./test, otherwise runs on all given files."
    exit
fi


if [ -z "$1" ]; then
    files=$(echo test/*.cl)
else
    # All command line arguments
    files=$@
fi

python util/ingen.py > in.txt

failCount=0
# For each .cl file
for x in $files; do
    echo -n "    $x: "
    cool --type $x
    
    # Compile and assemble the source
    err=`python main.py $x-type`
    
     if [[ $err ]]; then
	echo 'FAIL, error'
	echo "$err"
	((failCount++))
	continue
     fi

    gcc "${x%.cl}.s"

    # Run reference compiler and our code, store output for error compare
    comp=`cool $x < in.txt`
    test=`./a.out < in.txt`

    rm a.out
    
    if [[ $comp == $test ]]; then
	echo "pass"
    else
	echo "FAIL, non-matching output"
	echo "Reference:"
	echo "$comp"
	echo "Ours:"
	echo "$test"
	((failCount++))
    fi
	
    
done
if [[ $failCount == 0 ]]; then
    echo "All tests passed"
else
    echo "$failCount tests failed"
fi
