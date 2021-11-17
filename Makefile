test: test.l test.y test.c
	flex -o test.lex.c test.l
	bison -d test.y  
	gcc -o $@ test.tab.c test.lex.c test.c
clean:
	rm test.tab.* test.lex.c test