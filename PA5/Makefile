TESTS=$(wildcard test/*.cl)
TYPES=$(TESTS:.cl=.cl-type)

SRC=annast.ml expeval.ml main.ml
OBJ=$(patsubst %.ml,%.cmo,$(SRC))
default: $(OBJ) 
	ocamlc $(OBJ) 

clean:
	rm *.cmo *.cmi a.out test/*.cl-type

%.cmo: %.ml
	ocamlc -c $< -o $@

%.cl-type: %.cl
	cool --type $<

test: $(TYPES) default in.txt
	$(foreach f,$(TYPES), echo $(f);./a.out $(f) > out.txt < in.txt; cool $(f) < in.txt | diff out.txt -; rm out.txt;)

in.txt:
	python util/ingen.py
