GCC_FLAGS="-ggdb"
COMP="python main.py"
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


test: $(TEST_ASM)
    
