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

failCount=0
# For each .cl file
for x in $files; do
    echo -n "    $x: "
    
    # Update the parse on the input files
    cool --parse $x

    # Run reference compiler and our code, store output for error compare
    compErr=`cool --out temp --type $x`
    testErr=`ruby main.rb $x-ast`
    
    # If both error (nonempty stdout output), just pass
    # May require checking for same error
    if [[ ! -z "$compErr" ]] && [[ ! -z "$testErr" ]]; then
	cutcompErr=${compErr%%Type-Check:*}
	cuttestErr=${testErr%%Type-Check:*}
	if [[ "$cutcompErr" == "$cuttestErr" ]]; then
	    echo "pass, error"
	else
	    ((failCount++))
	    echo "FAIL, non-matching errors"
	    echo "Reference Compiler:
$compErr"
	    echo "Our typer:
$testErr"
	fi
	# If both don't error, compare type output
    elif [[ -z "$compErr" ]] && [[ -z "$testErr" ]]; then
	result=`diff temp.cl-type $x-type`
	if [ -z "$result" ]; then
	    echo "pass"
	else
	    ((failCount++))
	    echo "FAIL, non-matching output"
	    echo "$result"
	fi
	# If one errors but the other doesn't, fail and print both outputs (one empty)
    else
	((failCount++))
	echo "FAIL, Non-matching errors"
	echo "Reference Compiler:
$compErr"
	echo "Our typer:
$testErr"
    fi
    # if [[ -z "$compErr" ]]; then
    # 	#rm temp.cl-type
    # fi
    
done
if [[ $failCount == 0 ]]; then
    echo "All tests passed"
else
    echo "$failCount tests failed"
fi
