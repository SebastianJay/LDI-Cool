import sys
from cool_lexer import CoolLexer, tokens
import yacc

def p_expression_plus(p):
    'expr : expr plus expr'
    p[0] = ('addition', p[1], p[3])

def p_expression_mult(p):
    'expr : expr times expr'
    p[0] = ('multiplication', p[1], p[3])

def p_expression_id(p):
    'expr : integer'
    p[0] = ('integer', p[1])

def p_error(p):
    if p:
        print 'ERROR: '+str(p.lineno(0))+': Parser: syntax error'
    else:
        print 'ERROR: EOF: Parser: syntax error'

if __name__ == '__main__':
    lexer = CoolLexer()
    lexer.loadFromFile(sys.argv[1])

    parser = yacc.yacc()
    result = parser.parse(lexer=lexer, debug=True)
    print result
