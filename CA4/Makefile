COMP=./main.py
COOL=cool

TESTS=$(wildcard test/*.cl)
TEST_TYPES=$(patsubst %.cl,%.cl-type,$(TESTS))
TEST_ASM=$(patsubst %.cl,%.s,$(TESTS))

COMP_FILES=$(wildcard *.py) internals.s.txt

BENCH=valgrind --tool=callgrind --cache-sim=yes

all: $(TESTS) $(TEST_TYPES) $(TEST_ASM) ca5.zip

ca5.zip: $(COMP_FILES) team.txt
	zip ca5.zip $(COMP_FILES) team.txt

type: $(TESTS) $(TEST_TYPES)

%.cl-type: %.cl
	$(COOL) --type $<


%.s: %.cl-type $(COMP_FILES)
	$(COMP) $<

%.out: %.s
	gcc -g $<

internals.s.txt: internals.c
	gcc -O9 -S -o internals.s.txt internals.c
	sed -i 's/\(Object\|String\|IO\|Int\|Bool\)_\([^v]\)/\1\.\2/g' internals.s.txt
	sed -i 's/\(\w\+\)_vtable(%rip)/\$$\1_vtable/g' internals.s.txt
	sed -i 's/rep ret/ret/g' internals.s.txt
	echo "#END INTERNALS" >> internals.s.txt


clean:
	-rm -f test/*.cl-type test/*.s test/*.bench 

in.txt:
	./util/ingen.py > in.txt

.SILENT:test
test: all in.txt
	$(foreach t, $(TESTS), \
	    $(COOL) $(t) < in.txt > ref.out; \
	    gcc $(patsubst %.cl,%.s,$(t));\
	    ./a.out < in.txt > $(t).out; \
	    cmp $(t).out ref.out; \
	    rm -f $(t).out ref.out a.out;) 

%.bench: %.s in.txt
	gcc -g $<
	-mv $@ $@.old
	-$(BENCH) --callgrind-out-file=$@ ./a.out < in.txt > /dev/null
	-rm a.out
	

benchall: $(patsubst %.cl,%.bench,$(TESTS))
