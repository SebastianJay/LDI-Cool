from lex import LexToken

#definition for object passed to PLY's yacc parser to provide tokens
#reads the file produced by PA2 into a list, provides an element on every call to token()
class CoolLexer:
    def __init__(self):
        self.tokens = []
        self.tokindex = 0

    #fill token list with input from .cl-lex file
    def loadFromFile(self, pathname):
        #read in file from given path name, split by newline
        with open(pathname) as infile:
            lines = infile.readlines()
        lines = [line.strip() for line in lines]

        cnt = 0
        while cnt < len(lines):
            #instantiate new token struct (defined in lex.py)
            tok = LexToken()
            dcnt = 2

            #gather information about the next token
            tokline = int(lines[cnt])
            toktype = lines[cnt + 1]
            tokval = ''
            if toktype == 'string'      \
            or toktype == 'integer'     \
            or toktype == 'identifier'  \
            or toktype == 'type':
                tokval = lines[cnt + 2]
                dcnt = 3

            #fill struct and push it into list
            tok.type = toktype
            tok.value = tokval
            tok.lineno = tokline
            tok.lexpos = 0      #character position is not needed
            self.tokens.append(tok)
            cnt += dcnt

    #return next token and advance internal index; return None if finished
    def token(self):
        if self.tokindex >= len(self.tokens):
            return None
        self.tokindex += 1
        return self.tokens[self.tokindex - 1]

if __name__ == '__main__':
    lexer = CoolLexer()
    lexer.loadFromFile('test/readtest.cl-lex')
    while True:
        tok = lexer.token()
        if not tok:
            break
        print(tok)
