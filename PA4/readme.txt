For this assignment, we used Ruby. First, we translated our AST
serialization/deserialization from previous assignments from
Python. We also augmented the AST code to handle the internal classes
and expressions as well as type annotations. We then used the AST to build the class,
implementation, and parent maps. Using the collected map data, we
began checking for errors. Errors that did not require expression type
checking were checked first due to the requirements for PA4c,
afterwards we performed expression type checking. Our implementation
of the expression type checking added type annotations to the AST in
place, and if no errors were detected, we printed the final maps and
annotated AST. 

Python and Ruby are reasonably similar in syntax so our translation
was more or less one-to-one. The only major changes were an added type
field to the expression class and a 'preload' phase for loading internal
objects.

We bundled our type-maps into a single class with helper methods for
subclass and least upper bound checking. Our loading method for the
type-maps first built the parent map, by simply iterating over all the
classes in the AST and adding a class => parent entry for each
class. We also checked for inheritance related errors at the same
time. We used a recursive helper method to build the class and
implementation maps. For each class, the method built the entry for
the class' parent and prepended it to the part of the entry specific
to that class. The helper method also checked for feature redefinitions
and errors related to overriding. Our helper method for the subclass
relation handled the SELF_TYPE rules, then recursively walked up the
inheritance tree until the we found the supposed parent or reached the
top without finding the supposed parent. Our least upper bound method
handled the SELF_TYPE rules, then enumerated all of the first
argument's parents, and walked up the inheritance tree from the second
argument until it found a class in the first argument's parents and
returned that class as the result.

We then performed some preliminary error checking to satisfy PA4c's
requirements. These checks were fairly straight forward. [## Expand on
this?]

Finally, we performed expression type checking. The body of the
function is a large case statement, with branches for each type of
expression. In each branch we implemented the rules from the Cool
manual. We printed an error and exited whenever the conditions for a
rule were not satisfied, and also implemented some checks for errors
mentioned in the text surrounding the formal rules. The function
called itself recursively whenever a rule requires a sub-expression to
be checked.  

Our good test case attempts to test every expression type in Cool, and
checks least upper bound and subclass implementation with the if and
case expressions. Bad1 tests a static dispatch to a function defined
by the caller expression type, but not the static type. Bad2 checks
multiple uses of a type in a case expression. Bad3 checks a simple
formal-actual argument type mismatch. 
