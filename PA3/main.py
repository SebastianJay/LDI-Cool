import sys
from cool_lexer import CoolLexer, tokens
import yacc

#by default the first nonterminal specified is the start symbol
# in this case it should be "program"

#begin program grammar
def p_program(p):
    'program : classdef semi classlist'
    pass

def p_classlist_head(p):
    'classlist : classdef semi classlist'
    pass

def p_classlist_tail(p):
    'classlist : empty'
    pass
#end program grammar

#begin class grammar
def p_classdef(p):
    'classdef : class type optinherits lbrace featurelist rbrace'
    pass

def p_optinherits_nonempty(p):
    'optinherits : inherits type'
    pass

def p_optinherits_empty(p):
    'optinherits : empty'
    pass

def p_featurelist_head(p):
    'featurelist : feature semi featurelist'
    pass

def p_featurelist_tail(p):
    'featurelist : empty'
    pass

def p_feature_method(p):
    'feature : identifier lparen formalargs rparen colon type lbrace expr rbrace'
    pass

def p_formalargs_first(p):
    'formalargs : formal formallist'
    pass

def p_formalargs_empty(p):
    'formalargs : empty'
    pass

def p_formallist_head(p):
    'formallist : comma formal formallist'
    pass

def p_formallist_tail(p):
    'formallist : empty'
    pass

def p_feature_field(p):
    'feature : identifier colon type optinit'
    pass

def p_formal(p):
    'formal : identifier colon type'
    pass
#end class grammar

### BEGIN Expression Grammars
def p_expression_assign(p):
    'expr : identifier larrow expr'
    pass

#begin dynamic/static dispatch grammar
def p_expression_dispatch(p):
    'expr : expr opttype dot identifier lparen funcargs rparen'
    pass

def p_opttype_nonempty(p):
    'opttype : at type'
    pass

def p_opttype_empty(p):
    'opttype : empty'
    pass

def p_funcargs_first(p):
    'funcargs : expr funclist'
    pass

def p_funcargs_empty(p):
    'funcargs : empty'
    pass

def p_funclist_head(p):
    'funclist : comma expr funclist'
    pass

def p_funclist_tail(p):
    'funclist : empty'
    pass
#end dynamic/static dispatch grammar

#begin self dispatch grammar
def p_expression_selfdispatch(p):
    'expr : identifier lparen funcargs rparen'
    pass
#end self dispatch grammar

def p_expression_if(p):
    'expr : if expr then expr else expr fi'
    pass

def p_expression_while(p):
    'expr : while expr loop expr pool'
    pass

#begin block statement grammar
def p_expression_block(p):
    'expr : lbrace expr semi blocklist rbrace'
    pass

def p_blocklist_head(p):
    'blocklist : expr semi blocklist'
    pass

def p_blocklist_tail(p):
    'blocklist : empty'
    pass
#end block statement grammar

#begin let statement grammar
def p_expression_let(p):
    'expr : let identifier colon type optinit letlist in expr'
    pass

def p_optinit_nonempty(p):
    'optinit : larrow expr'
    pass

def p_optinit_empty(p):
    'optinit : empty'
    pass

def p_letlist_head(p):
    'letlist : comma identifier colon type optinit letlist'
    pass

def p_letlist_tail(p):
    'letlist : empty'
    pass
#end let statement grammar

#begin case statement grammar
def p_expression_case(p):
    'expr : case expr of identifier colon type rarrow expr semi caselist esac'
    pass

def p_caselist_head(p):
    'caselist : identifier colon type rarrow expr semi caselist'
    pass

def p_caselist_tail(p):
    'caselist : empty'
    pass
#end case statement grammar

def p_expression_newtype(p):
    'expr : new type'
    pass

def p_expression_isvoid(p):
    'expr : isvoid expr'
    pass

def p_expression_plus(p):
    'expr : expr plus expr'
    #p[0] = ('addition', p[1], p[3])
    pass

def p_expression_minus(p):
    'expr : expr minus expr'
    pass

def p_expression_times(p):
    'expr : expr times expr'
    #p[0] = ('multiplication', p[1], p[3])
    pass

def p_expression_divide(p):
    'expr : expr divide expr'
    pass

def p_expression_negate(p):
    'expr : tilde expr'
    pass

def p_expression_lt(p):
    'expr : expr lt expr'
    pass

def p_expression_lte(p):
    'expr : expr le expr'
    pass

def p_expression_equals(p):
    'expr : expr equals expr'
    pass

def p_expression_not(p):
    'expr : not expr'
    pass

def p_expression_paren(p):
    'expr : lparen expr rparen'
    pass

def p_expression_id(p):
    'expr : identifier'
    pass

def p_expression_integer(p):
    'expr : integer'
    #p[0] = ('integer', p[1])
    pass

def p_expression_string(p):
    'expr : string'
    pass

def p_expression_true(p):
    'expr : true'
    pass

def p_expression_false(p):
    'expr : false'
    pass

#Empty production
def p_empty(p):
    'empty :'
    pass    #leave as is

def p_error(p):
    if p:
        print 'ERROR: '+str(p.lineno)+': Parser: syntax error'
    else:
        print 'ERROR: EOF: Parser: syntax error'

if __name__ == '__main__':
    lexer = CoolLexer()
    lexer.loadFromFile(sys.argv[1])

    parser = yacc.yacc()
    #turn debug off when submitting
    result = parser.parse(lexer=lexer, debug=False)
    print result
