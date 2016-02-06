//TODO fix global vars?
parsednum = 0;
numscomments = 0;
strbuf = '';

var fs = require('fs');
var inpath = process.argv[2];
fs.readFile(inpath, 'ASCII', function (err, data) {
    if (err) {
    	console.log(err);
    	return;
    }

    var parser= require('./grammar').parser;
    var lexer = parser.lexer;

    var outtokens = [];
    var errtext = '';

    lexer.setInput(data);
    while(!lexer.done) {
    	token = lexer.lex();
        /// NOTE: lexer increments line number before newline,
        ///       assignment wants after
        //TODO on my machine the numbering starts at 1 and increments by 2 each line
        //      probably a Windows line ending difference
        //TODO on my machine single line comments cause the line counter to inc by 2
        //var linenum = Math.floor(lexer.yylineno / 2) + 1;
        var linenum = lexer.yylineno + 1;
        //var linenum = lexer.yylineno + 1 - numscomments;

        //file finished check
        if (token === "EOF" || token === 1) {
            break;
        }

        //error checks
        if (token === "BAD_PATTERN") {
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
            errtext = 'ERROR: ' + (linenum-1) + ': Lexer: Invalid newline in string';
            break;
        }
        if (token === "NUL_IN_STRING") {
            errtext = 'ERROR: ' + linenum + ': Lexer: Invalid NUL in string';
            break;
        }
        if (token === "INTEGER_TOO_LARGE") {
            errtext = 'ERROR: ' + linenum + ': Lexer: Integer constant not 32-bit unsigned: ' + lexer.yytext;
            break;
        }

        if (token === "WHITESPACE") {
            continue;
        }

        //valid tokens
        if (token === "STRING") {
            //strbuf was declared in grammer.js
            outtokens.push(linenum + '\n' + token.toLowerCase() + '\n' + strbuf);
        } else if (token === "INTEGER") {
            //parsednum was declared in grammar.js
            outtokens.push(linenum + '\n' + token.toLowerCase() + '\n' + parsednum);
        } else if (token === "IDENTIFIER" || token === "TYPE"){
            outtokens.push(linenum + '\n' + token.toLowerCase() + '\n' + lexer.yytext);
        } else {
            outtokens.push(linenum + '\n' + token.toLowerCase());
        }
    }

    if (errtext) {
        process.stdout.write(errtext + '\n');
    } else {
        var i;
        var outbuffer = '';
        for (i = 0; i < outtokens.length; i+=1) {
            //process.stdout.write(outtokens[i]);
            //process.stdout.write('\n');
            outbuffer += outtokens[i] + '\n';
        }

        var lastind = inpath.lastIndexOf('.');
        var foutprefix = '';
        if (lastind === -1) {
            foutprefix = inpath;
        } else {
            foutprefix = inpath.substr(0, lastind);
        }
        var foutname = foutprefix + '.cl-lex';
        fs.writeFile(foutname, outbuffer, 'ASCII', function(err) {
            if (err) {
                console.log(err);
            }
        });
    }

});
