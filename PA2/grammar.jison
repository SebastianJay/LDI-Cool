%lex

/*
TODO: the keywords will match even when having extra suffix
e.g. "caseee" will (1) match case ["case"] and (2) match identifier ["ee"] 
*/
%%
[cC][aA][sS][eE]				return "CASE";
[cC][lL][aA][sS][sS]			return "CLASS";
[eE][lL][sS][eE]				return "ELSE";
[eE][sS][aA][cC]				return "ESAC";
f[aA][lL][sS][eE]				return "FALSE";
[fF][iI]						return "FI";
[iI][fF]						return "IF";
[iI][nN][hH][eE][rR][iI][tT][sS]	return "INHERITS";
[iI][nN]						return "IN";
[iI][sS][vV][oO][iI][dD]		return "ISVOID";
[lL][eE][tT]					return "LET";
[lL][oO][oO][pP]				return "LOOP";
[nN][eE][wW]					return "NEW";
[nN][oO][tT]					return "NOT";
[oO][fF]						return "OF";
[pP][oO][oO][lL]				return "POOL";
[tT][hH][eE][nN]				return "THEN";
t[rR][uU][eE]					return "TRUE";
[wW][hH][iI][lL][eE]			return "WHILE";
\=\>							return "RARROW";
\<\-							return "LARROW";
\<\=							return "LE";
\@								return "AT";
\:								return "COLON";
\,								return "COMMA";
\/								return "DIVIDE";
\.								return "DOT";
\=								return "EQUALS";
\{								return "LBRACE";
\}								return "RBRACE";
\(								return "LPAREN";
\)								return "RPAREN";
\<								return "LT";
\-								return "MINUS";
\+								return "PLUS";
\;								return "SEMI";
\~								return "TILDE";
\*								return "TIMES";
\s								return "WHITESPACE";
[0-9]+ 							return "NUMBER";
\w[\w[0-9]]*   					return "IDENTIFIER";
<<EOF>>							%{ return "EOF"; %}
.*								%{ return "BADPATTERN"; %}
/lex
%%


/* does this part serve a purpose? */
TOKEN
	: WHITESPACE
	| NUMBER
	| CLASS
	| IDENTIFIER
	;
