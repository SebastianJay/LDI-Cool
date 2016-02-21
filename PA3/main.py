import sys
from cool_lexer import CoolLexer, tokens
import yacc
from ast import *

precedence = (
    ('right', 'larrow'),
    ('nonassoc', 'not'),
    ('nonassoc', 'lt', 'le', 'equals'),
    ('left', 'plus', 'minus'),
    ('left', 'times', 'divide'),
    ('nonassoc', 'isvoid'),
    ('nonassoc', 'tilde'),
    ('left', 'at'),
    ('left', 'dot'),
)

start = 'program'

#Empty production
def p_empty(p):
    'empty :'
    pass    #leave as is

#begin program grammar
def p_program(p):
    'program : classdef semi classlist'
    p[0] = AST([p[1]] + p[3])

def p_classlist_head(p):
    'classlist : classdef semi classlist'
    p[0] = [p[1]] + p[3]

def p_classlist_tail(p):
    'classlist : empty'
    p[0] = []
#end program grammar

#begin class grammar
def p_classdef(p):
    'classdef : class type optinherits lbrace featurelist rbrace'
    p[0] = ASTClass(
        ASTIdentifier(p.lineno(2),p[2]),
        p[3],
        p[5])

def p_optinherits_nonempty(p):
    'optinherits : inherits type'
    p[0] = ASTIdentifier(p.lineno(2), p[2])

def p_optinherits_empty(p):
    'optinherits : empty'
    p[0] = None

def p_featurelist_head(p):
    'featurelist : feature semi featurelist'
    p[0] = [p[1]] + p[3]

def p_featurelist_tail(p):
    'featurelist : empty'
    p[0] = []

def p_feature_method(p):
    'feature : identifier lparen formalargs rparen colon type lbrace expr rbrace'
    p[0] = ASTMethod(
        ASTIdentifier(p.lineno(1), p[1]),
        p[3],
        ASTIdentifier(p.lineno(6), p[6]),
        p[8])

def p_formalargs_first(p):
    'formalargs : formal formallist'
    p[0] = [p[1]] + p[2]

def p_formalargs_empty(p):
    'formalargs : empty'
    p[0] = []

def p_formallist_head(p):
    'formallist : comma formal formallist'
    p[0] = [p[2]] + p[3]

def p_formallist_tail(p):
    'formallist : empty'
    p[0] = []

def p_feature_field(p):
    'feature : identifier colon type optinit'
    p[0] = ASTAttribute(
        ASTIdentifier(p.lineno(1), p[1]),
        ASTIdentifier(p.lineno(3), p[3]),
        p[4])

def p_formal(p):
    'formal : identifier colon type'
    p[0] = (ASTIdentifier(p.lineno(1), p[1]),
            ASTIdentifier(p.lineno(3), p[3]))
#end class grammar

### BEGIN Expression Grammars
def p_expression_assign(p):
    'expr : identifier larrow expr'
    p[0] = ASTExpression(p.lineno(1), "assign", (ASTIdentifier(p.lineno(1), p[1]), p[3]))

#begin dynamic/static dispatch grammar
def p_expression_dispatch(p):
    'expr : expr opttype dot identifier lparen funcargs rparen'
    # Static dispatch, class is specified
    if p[2] is not None:
        p[0] = ASTExpression(
            p.lineno(1),
            "static_dispatch",
            (
                p[1],
                p[2],
                ASTIdentifier(p.lineno(4), p[4]),
                p[6]
            ))
    # Dynamic dispatch, no type
    else:
        p[0] = ASTExpression(
            p.lineno(1),
            "dynamic_dispatch",
            (
                p[1],
                ASTIdentifier(p.lineno(4), p[4]),
                p[6]
            ))

def p_opttype_nonempty(p):
    'opttype : at type'
    p[0] = ASTIdentifier(p.lineno(2), p[2])

def p_opttype_empty(p):
    'opttype : empty'
    return None

def p_funcargs_first(p):
    'funcargs : expr funclist'
    p[0] = [p[1]] + p[2]

def p_funcargs_empty(p):
    'funcargs : empty'
    p[0] = []

def p_funclist_head(p):
    'funclist : comma expr funclist'
    p[0] = [p[2]] + p[3]

def p_funclist_tail(p):
    'funclist : empty'
    p[0] = []
#end dynamic/static dispatch grammar

#begin self dispatch grammar
def p_expression_selfdispatch(p):
    'expr : identifier lparen funcargs rparen'
    p[0] = ASTExpression(
        p.lineno(1),
        "self_dispatch",
        (
            ASTIdentifier(p.lineno(1), p[1]),
            p[3]
        )
    )
#end self dispatch grammar

def p_expression_if(p):
    'expr : if expr then expr else expr fi'
    p[0] = ASTExpression(
        p.lineno(1),
        "if",
        (p[2],p[4],p[6]))

def p_expression_while(p):
    'expr : while expr loop expr pool'
    p[0] = ASTExpression(
        p.lineno(1),
        "while",
        (p[2],p[4])
    )

#begin block statement grammar
def p_expression_block(p):
    'expr : lbrace expr semi blocklist rbrace'
    p[0] = ASTExpression(
        p.lineno(1),
        "block",
        [p[2]] + p[4])

def p_blocklist_head(p):
    'blocklist : expr semi blocklist'
    p[0] = [p[1]] + p[3]

def p_blocklist_tail(p):
    'blocklist : empty'
    p[0] = []
#end block statement grammar

#begin let statement grammar
def p_expression_let(p):
    'expr : let identifier colon type optinit letlist in expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "let",
        ([ASTLetBinding(
            ASTIdentifier(p.lineno(2), p[2]),
            ASTIdentifier(p.lineno(4), p[4]),
            p[5])] + p[6],
         p[8]))


def p_optinit_nonempty(p):
    'optinit : larrow expr'
    p[0] = p[2]

def p_optinit_empty(p):
    'optinit : empty'
    p[0] = None

def p_letlist_head(p):
    'letlist : comma identifier colon type optinit letlist'
    p[0] = [ASTLetBinding(\
                          ASTIdentifier(p.lineno(2), p[2]),
                          ASTIdentifier(p.lineno(4), p[4]),
                          p[5])] + p[6]

def p_letlist_tail(p):
    'letlist : empty'
    p[0] = []
#end let statement grammar

#begin case statement grammar
def p_expression_case(p):
    'expr : case expr of identifier colon type rarrow expr semi caselist esac'
    p[0] = ASTExpression(
        p.lineno(1),
        "case",
        (p[2],[ASTCase(ASTIdentifier(p.lineno(4),p[4]),
                      ASTIdentifier(p.lineno(6),p[6]),
                      p[8])] + p[10]))


def p_caselist_head(p):
    'caselist : identifier colon type rarrow expr semi caselist'
    p[0] = [ASTCase(ASTIdentifier(p.lineno(1),p[1]),
                      ASTIdentifier(p.lineno(3),p[3]),
                      p[5])] + p[7]

def p_caselist_tail(p):
    'caselist : empty'
    p[0] = []
#end case statement grammar

def p_expression_newtype(p):
    'expr : new type'
    p[0] = ASTExpression(p.lineno(1), "new", ASTIdentifier(p.lineno(2), p[2]))

def p_expression_isvoid(p):
    'expr : isvoid expr'
    p[0] = ASTExpression(p.lineno(1), "isvoid", p[2])

def p_expression_plus(p):
    'expr : expr plus expr'
    #p[0] = ('addition', p[1], p[3])
    p[0] = ASTExpression(
        p.lineno(1),
        "plus",
        (p[1],p[3]))


def p_expression_minus(p):
    'expr : expr minus expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "minus",
        (p[1],p[3]))

def p_expression_times(p):
    'expr : expr times expr'
    #p[0] = ('multiplication', p[1], p[3])
    p[0] = ASTExpression(
        p.lineno(1),
        "times",
        (p[1],p[3]))

def p_expression_divide(p):
    'expr : expr divide expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "divide",
        (p[1],p[3]))

def p_expression_negate(p):
    'expr : tilde expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "negate",
        p[2])

def p_expression_lt(p):
    'expr : expr lt expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "lt",
        (p[1],p[3]))

def p_expression_lte(p):
    'expr : expr le expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "le",
        (p[1],p[3]))

def p_expression_equals(p):
    'expr : expr equals expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "eq",
        (p[1],p[3]))

def p_expression_not(p):
    'expr : not expr'
    p[0] = ASTExpression(
        p.lineno(1),
        "not",
        p[2])

def p_expression_paren(p):
    'expr : lparen expr rparen'
    p[0] = p[2]

def p_expression_id(p):
    'expr : identifier'
    p[0] = ASTExpression(p.lineno(1),
                         "identifier",
                         ASTIdentifier(p.lineno(1),p[1]))

def p_expression_integer(p):
    'expr : integer'
    p[0] = ASTExpression(p.lineno(1),
                         "integer",
                         int(p[1]))

def p_expression_string(p):
    'expr : string'
    p[0] = ASTExpression(p.lineno(1),
                         "string",
                         p[1])

def p_expression_true(p):
    'expr : true'
    p[0] = ASTExpression(p.lineno(1),
                         "true",
                         "")

def p_expression_false(p):
    'expr : false'
    p[0] = ASTExpression(p.lineno(1),
                         "false",
                         "")

def p_error(p):
    if p:
        print 'ERROR: '+str(p.lineno)+': Parser: syntax error'
        sys.exit(1)
    else:
        #TODO report line number instead of EOF (low priority)
        print 'ERROR: EOF: Parser: syntax error'
        sys.exit(1)

if __name__ == '__main__':
    lexer = CoolLexer()
    lexer.loadFromFile(sys.argv[1])

    parser = yacc.yacc()
    #turn debug off when submitting
    result = parser.parse(lexer=lexer, tracking=True, debug=False)
    with open(sys.argv[1].replace("-lex",'-ast'), 'w') as outFile:
        outFile.write(str(result))
