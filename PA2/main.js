
var fs = require('fs');
fs.readFile(process.argv[2], 'ASCII', function (err, data) {
    if (err) {
    	console.log(err);
    	return;
    }

    var parser= require('./grammar').parser;
    var lexer = parser.lexer;

    /// NOTE: lexer increments line number before newline,
    ///       assignment wants after

    lexer.setInput(data);
    while(!lexer.done) {
    	token = lexer.lex();
        //TODO on my machine the numbering starts at 1 and increments by 2 each line
        var linenum = Math.floor(lexer.yylineno / 2) + 1;
        if (token === "EOF") {
            break;
        }
        if (token === "BADPATTERN") {
            console.log('ERROR: ' + (linenum) + ': Lexer: Invalid character pattern: ' + lexer.yytext);
            break;
        }
        if (token === "WHITESPACE" || token === "COMMENT") {
            continue;
        }
	    console.log((linenum) + "\n" + token + "\n" + lexer.yytext);
    }
    //TODO: buffer valid output and print it here
});
