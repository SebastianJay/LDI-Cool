COMP=./main.py
COOL=cool

TESTS=$(wildcard test/*.cl)
TEST_TYPES=$(patsubst %.cl,%.cl-type,$(TESTS))
TEST_ASM=$(patsubst %.cl,%.s,$(TESTS))

COMP_FILES=$(wildcard *.py)

BENCH=valgrind --tool=callgrind --cache-sim=yes

build: $(TESTS) $(TEST_TYPES) $(TEST_ASM)

%.cl-type: %.cl
	$(COOL) --type $<


%.s: %.cl-type $(COMP_FILES)
	$(COMP) $<


clean:
	-rm -f $(TEST_TYPES) $(TEST_ASM) $(patsubst %.cl,%.bench,$(TESTS))

in.txt:
	./util/ingen.py > in.txt

.SILENT:test
test: build in.txt
	$(foreach t, $(TESTS), \
	    $(COOL) $(t) < in.txt > ref.out; \
	    gcc $(patsubst %.cl,%.s,$(t));\
	    ./a.out < in.txt > $(t).out; \
	    diff -q $(t).out ref.out; \
	    rm -f $(t).out ref.out a.out;) 

%.bench: %.s in.txt
	gcc -g $<
	-$(BENCH) --callgrind-out-file=$@ ./a.out < in.txt > /dev/null
	-rm a.out
	

benchall: $(patsubst %.cl,%.bench,$(TESTS))
