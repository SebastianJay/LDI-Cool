
fs = require('fs');
fs.readFile(process.argv[2], 'ASCII', function (err, data) {
    if (err) {
	console.log(err);
	return;
    }
    
    var parser= require("./grammar").parser;
    var lexer = parser.lexer;

    /// NOTE: lexer increments line number before newline,
    ///       assignment wants after

    lexer.setInput(data);
    while(!lexer.done) {
	token = lexer.lex();
	// Lexer gives an end of file token: 1
	if (token != 1)
	    console.log((lexer.yylineno+1) + "\n" + token + "\n" + lexer.yytext); 
    }

});
