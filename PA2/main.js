//TODO fix global vars?

// Stores parsed integers
parsednum = 0;

// Stores parsed strings
strbuf = '';

// Stores current line number
linenum = 1;

// Read in file from path in first commandline argument
var fs = require('fs');
var inpath = process.argv[2];
fs.readFile(inpath, 'ASCII', function (err, data) {
    // If file IO error
    if (err) {
    	console.log(err);
    	return;
    }

    // Initialize jison lexer
    var parser= require('./grammar').parser;
    var lexer = parser.lexer;

    // List of tokens, each element is a string of the form:
    // linenum
    // token
    // [actual text]
    var outtokens = [];
    // Message to output on lexer error
    var errtext = '';

    // Lex the contents of the opened file
    lexer.setInput(data);

    while(!lexer.done) {
	// Get next token
    	token = lexer.lex();

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
            errtext = 'ERROR: ' + linenum + ': Lexer: Invalid newline in string';
            break;
        }
        if (token === "NUL_IN_STRING") {
            errtext = 'ERROR: ' + linenum + ': Lexer: Invalid NUL in string';
            break;
        }
	if (token == "STRING_TOO_LONG") {
	    errtext = "ERROR: " + linenum + ": Lexer: String constant longer than 1024 characters";
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
            outtokens.push(linenum + '\n' + token.toLowerCase() + '\n' + strbuf);
        } else if (token === "INTEGER") {
            outtokens.push(linenum + '\n' + token.toLowerCase() + '\n' + parsednum);
        } else if (token === "IDENTIFIER" || token === "TYPE"){
            outtokens.push(linenum + '\n' + token.toLowerCase() + '\n' + lexer.yytext);
        } else {
            outtokens.push(linenum + '\n' + token.toLowerCase());
        }
    }

    // If there was an error print the error text
    if (errtext) {
        process.stdout.write(errtext + '\n');
    } else {
        // Other wise print out the
	var i;
        var outbuffer = '';
        for (i = 0; i < outtokens.length; i+=1) {
            outbuffer += outtokens[i] + '\n';
        }
	
	// Find extension in input path
        var lastind = inpath.lastIndexOf('.');
        
	// Get input path without extension
	var foutprefix = '';
        if (lastind === -1) {
            foutprefix = inpath;
        } else {
            foutprefix = inpath.substr(0, lastind);
        }
	
	// Output is input.cl-lex
        var foutname = foutprefix + '.cl-lex';
        
	// Write out tokens
	fs.writeFile(foutname, outbuffer, 'ASCII', function(err) {
            if (err) {
                console.log(err);
            }
        });
    }

});
