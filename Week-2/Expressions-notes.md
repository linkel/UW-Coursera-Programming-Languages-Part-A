## Getting Started with Emacs SML mode

Ctrl-x ctrl-f to find a file and enter a pathname, can also create a new file through this

Ctrl-c ctrl-s while inside sml mode to launch the SML REPL.

You can type `use "myFile.sml";` in order to load that SML file up and consequently make use of its environment.

## Environment

A static environment is the typechecking part of when it begins to evaluate SML code. This runs first. 
A dynamic environment is then the result of the evaluation of what your code contains. So if it fails the typechecking, it won't get here. 

## Expressions

val abs_of_z = if z < 0 then 0 - z else z;

The part after val and before the equals sign is a variable. The part after the equals sign is an expression! 

All expressions can be broken down into three conceptual parts:

1. Syntax
2. Typechecking Rules
3. Evaluation Rules

First, syntax is how you write the expression, how you use words to form the code. Stuff like if, + operators, the val keyword. 

Second, typechecking rules control what you can put in each part of an expression. In the above example, what comes after the if keyword is a boolean. The two possible results of the fork after the conditional have the type integer. 

Third, evaluation rules are what value comes out of the expression. If that boolean in the above example evaluates to the value true, then the first part of the fork occurs. Otherwise, the latter part does. The end result will be of type integer. 

A value is the result of a valid expression.

All values are expressions, but not all expressions are values. 

## What's the syntax, typechecking rules, and evaluation rules for "less than" ?

My thoughts:

val a = x < y 

x and y would have to be ints, and the result of this would be a bool. 