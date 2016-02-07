%lex
%x scomment
%x mcomment
%x string
%%
<INITIAL>[\-]{2}					this.begin('scomment');
<scomment><<EOF>>					%{ this.popState(); return "EOF"; %}
<scomment>[\x1a]					%{ this.popState(); return "EOF"; %}
<scomment>\n					%{ this.popState(); linenum += 1; %}		/* TODO resolve newline differences */
<scomment>[^\n\x1a]				/* skip, note: compiler doesn't like \x1a, not sure what it is */

<INITIAL>[(][*]						this.begin('mcomment');
<mcomment>[(][*]					this.begin('mcomment');
<mcomment><<EOF>>					return "EOF_IN_COMMENT";
<mcomment>[\x1a]					return "EOF_IN_COMMENT";
<mcomment>[*][)]					this.popState();
<mcomment>[*]						/* skip */
<mcomment>[)]						/* skip */
<mcomment>[(]						/* skip */
<mcomment>\n						linenum+=1;
<mcomment>[^()*\x1a\n]+				/* skip */

<INITIAL>[\"]						%{ this.begin('string'); strbuf = ''; %}
<string><<EOF>>						return "EOF_IN_STRING";
<string>\n						return "NEWLINE_IN_STRING";
<string>\r						strbuf += yytext; /* apparently \r on its own is not a newline */
<string>[\0]						return "NUL_IN_STRING";
<string>[\x1a]						return "EOF_IN_STRING";
<string>[\"]						%{ this.popState(); if (strbuf.length > 1024) return "STRING_TOO_LONG"; else return "STRING"; %}
<string>\\\\						strbuf += yytext;
<string>\\\"						strbuf += yytext;
<string>\\						strbuf += yytext;
<string>[^\"\\\r\n\0\x1a]+			strbuf += yytext;

\b[cC][aA][sS][eE]\b				return "CASE";
\b[cC][lL][aA][sS][sS]\b			return "CLASS";
\b[eE][lL][sS][eE]\b				return "ELSE";
\b[eE][sS][aA][cC]\b				return "ESAC";
\bf[aA][lL][sS][eE]\b				return "FALSE";
\b[fF][iI]\b						return "FI";
\b[iI][fF]\b						return "IF";
\b[iI][nN][hH][eE][rR][iI][tT][sS]\b	return "INHERITS";
\b[iI][nN]\b						return "IN";
\b[iI][sS][vV][oO][iI][dD]\b		return "ISVOID";
\b[lL][eE][tT]\b					return "LET";
\b[lL][oO][oO][pP]\b				return "LOOP";
\b[nN][eE][wW]\b					return "NEW";
\b[nN][oO][tT]\b					return "NOT";
\b[oO][fF]\b						return "OF";
\b[pP][oO][oO][lL]\b				return "POOL";
\b[tT][hH][eE][nN]\b				return "THEN";
\bt[rR][uU][eE]\b					return "TRUE";
\b[wW][hH][iI][lL][eE]\b			return "WHILE";
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
[0-9]+							%{	parsednum = parseInt(yytext, 10);
									if (parsednum <= 2147483647) {
										return "INTEGER";
									} else {
										return "INTEGER_TOO_LARGE";
									}
								%}
[a-z][a-zA-Z0-9_]*  	 		return "IDENTIFIER";
[A-Z][a-zA-Z0-9_]*				return "TYPE";
\n						%{ linenum += 1; return "WHITESPACE"; %}
[ \f\r\t\v]+					return "WHITESPACE";	/* being redundant but safe */
<<EOF>>							return "EOF";
.*								return "BAD_PATTERN";

/lex
%%

/* Unnecessary, but keeps jison from crashing */
TOKEN
	: WHITESPACE
	| NUMBER
	| CLASS
	| IDENTIFIER
	;
