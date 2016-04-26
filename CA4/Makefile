GCC_FLAGS="-ggdb"
COMP="./main.py"
COOL="cool"

TESTS=$(wildcard test/*.cl)
TEST_TYPES=$(patsubst %.cl,%.cl-type,$(TESTS))
TEST_ASM=$(patsubst %.cl,%.s,$(TESTS))

build: $(TESTS) $(TEST_TYPES) $(TEST_ASM)

%.cl-type: %.cl
	$(COOL) --type $<


%.s: %.cl-type
	$(COMP) $<


clean:
	rm -f $(TEST_TYPES) $(TEST_ASM)

in.txt:
	./util/ingen.py > in.txt

.SILENT:test
test: build in.txt
	$(foreach t, $(TESTS), \
	    cool $(t) < in.txt > ref.out; \
	    gcc $(patsubst %.cl,%.s,$(t));\
	    ./a.out < in.txt > $(t).out; \
	    diff $(t).out ref.out; \
	    rm -f $(t).out ref.out a.out;) 

bench: build in.txt

