%lex

%%
\s	return "WHITESPACE";
[0-9]+ 	return "NUMBER";
\w[\w[0-9]]*   return "INDENTIFIER";
/lex

%%

TOKEN
	: WHITESPACE
	| NUMBER
	| IDENTIFIER
	|
	;
