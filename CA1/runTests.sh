#!/bin/bash

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: $0 [test1] [test2] ...
If no argument given, runs on all .cl-tac files in ./test, otherwise runs on all given files."
    exit
fi


if [ -z "$1" ]; then
    files=$(echo test/*.cl-tac)
else
    # All command line arguments
    files=$@
fi

testStr="$RANDOM\n$RANDOM\n$RANDOM\n$RANDOM"

failCount=0
# For each .cl file
for x in $files; do
    if [ ${x: -3} == ".cl" ]; then
	compErr=`cool --tac $x`
	if [[ ! -z  $compErr ]]; then
	    echo "Failed to generate TAC code for $x"
	    echo $compErr
	    continue
	fi
	x="$x-tac"
    fi
    echo -n "    $x: "
    
    optErr=`python main.py < $x > temp.cl-tac`
    if [[ ! -z $optErr ]]; then
	echo "Optimizer error"
	echo "$optErr"
	$((failCount++))
	continue
    fi
    
    runErr=`echo -e "$testStr" | cool temp.cl-tac > temp.out` 
    if [[ ! -z $runErr ]]; then
	echo "Error running optimized code"
	echo "$runErr"
	$((failCount++))
	continue
    fi
    
    echo -e "$testStr" | cool $x > reg.out
    
    outDiff=`diff reg.out temp.out`
    rm temp.out
    rm reg.out

    if [[ ! -z $outDiff ]]; then
	echo "FAILED, non-matching output"
	echo "$outDiff"
	$((failCount++))
    else
	echo "passed"
	lineDiff=`diff $x temp.cl-tac | grep '<' | grep -v 'comment' | wc -l`
	echo "    $lineDiff lines removed"
    fi
    rm temp.cl-tac

done
if [[ $failCount == 0 ]]; then
    echo "All tests passed"
else
    echo "$failCount tests failed"
fi
