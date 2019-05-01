## Functions

Functions are fairly straightforward! They are declared by using the keyword `fun` and you specify parameters with their types.

fun myFunction (x: int, y: int) =
    x + y + 1

It takes an expression after the equals sign and gets evaluated when you call it. 

myFunction(4,5);

Functions very often will be recursive in SML to get things done--there are no loops in SML. 

fun pow(x:int, y:int) =
    if y = 0
    then 1
    else x * pow(x,y-1)

## Typechecking functions

The body, or the expression, gets type-checked in a static environment. It maps each piece to its type. Function types look like an argument type with an arrow into a result type. 

t1 * t2 -> t

## Function evaluation

A function is a value. When we declare it, it gets added to the dynamic environment. 

## Calling a function

When we call it with parameters, the expression in it gets plugged in and eval'd. 