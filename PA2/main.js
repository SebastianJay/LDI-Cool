var parser= require("./grammar").parser;
var lexer = parser.lexer;


lexer.setInput('123 hello 3 a334\nanother');
while(!lexer.done) {
    token = lexer.lex();
    console.log((lexer.yylineno+1) + "\n" + token + "\n" + lexer.yytext);    
}
