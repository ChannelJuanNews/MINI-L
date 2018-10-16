all : phase1.lex lex.yy.c
	make fib
	make mytest
	make primes

fib : phase1.lex lex.yy.c
	flex phase1.lex
	g++ -o lexer lex.yy.c -ll -w
	cat test/fib.min | ./lexer > ./lexerout/fib.txt
	diff -s ./output/fib.txt ./lexerout/fib.txt

mytest : phase1.lex lex.yy.c
	flex phase1.lex
	g++ -o lexer lex.yy.c -ll -w
	cat test/mytest.min | ./lexer > ./lexerout/mytest.txt
	diff -s ./output/mytest.txt ./lexerout/mytest.txt

primes : phase1.lex lex.yy.c
	flex phase1.lex
	g++ -o lexer lex.yy.c -ll -w
	cat test/primes.min | ./lexer > ./lexerout/primes.txt
	diff -s ./output/primes.txt ./lexerout/primes.txt
