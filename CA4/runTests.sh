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
    python main.py $x-type 2> comperr.tmp
    
    if [[ `cat comperr.tmp` ]]; then
	echo 'FAIL, compiler error'
	((failCount++))
	continue
    fi

    rm comperr.tmp
    
    gcc "${x%.cl}.s" 2> comperr.tmp
    if [[ `cat comperr.tmp` ]]; then
	echo 'FAIL, assembling error'
	((failCount++))
	continue
    fi
    
    rm comperr.tmp
  
    # Run reference compiler and our code, store output for error compare
    comp=`cool $x < in.txt > out2.txt`
    test=`./a.out < in.txt > out1.txt`

    if [[ `cat out1.txt` == *"ERROR:"* ]] && [[ `cat out2.txt` == *"ERROR:"* ]]; then
	echo "pass, error"
	rm out2.txt
	rm out1.txt
	continue
    fi
    
    d=`diff out2.txt out1.txt`

    rm a.out

    if [[ -z $d ]]; then
	echo "pass"
    else
	echo "FAIL, non-matching output"
	echo "Output:"
	echo `cat out1.txt | head -c 1000`
	echo
	echo "Expected:"
	echo `cat out2.txt | head -c 1000`
	echo
	((failCount++))
    fi
    
    rm out1.txt
    rm out2.txt
	
    
done
if [[ $failCount == 0 ]]; then
    echo "All tests passed"
else
    echo "$failCount tests failed"
fi
