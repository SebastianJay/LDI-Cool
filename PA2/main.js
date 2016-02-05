
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

    var errtext = '';
    lexer.setInput(data);
    while(!lexer.done) {
    	token = lexer.lex();
        //TODO on my machine the numbering starts at 1 and increments by 2 each line
        //      probably a Windows line ending difference
        var linenum = Math.floor(lexer.yylineno / 2) + 1;

        //file finished check
        if (token === "EOF" || token === 1) {
            break;
        }

        //error checks
        if (token === "BADPATTERN") {
            errtext = 'ERROR: ' + linenum + ': Lexer: Invalid character pattern: ' + lexer.yytext;
            break;
        }
        if (token === "EOF_IN_COMMENT") {
            errtext = 'ERROR: ' + linenum + ': Lexer: File ended before (* comment *) terminated';
            break;
        }
        if (token === "EOF_IN_STRING") {
            errtext = 'ERROR: ' + linenum + ': Lexer: File ended before "string" terminated';
            break;
        }
        if (token === "NEWLINE_IN_STRING") {
            errtext = 'ERROR: ' + linenum + ': Lexer: Invalid newline in string';
            break;
        }
        if (token === "NUL_IN_STRING") {
            errtext = 'ERROR: ' + linenum + ': Lexer: Invalid NUL in string';
            break;
        }

        if (token === "WHITESPACE") {
            continue;
        }

        //valid tokens
        if (token === "STRING") {
            //strbuf was declared in grammer.jison
            console.log((linenum) + "\n" + token + "\n" + strbuf);
        } else {
            console.log((linenum) + "\n" + token + "\n" + lexer.yytext);
        }
    }

    if (errtext) {
        console.log(errtext);
    } else {
        //TODO: buffer valid output and print it here
    }

});
