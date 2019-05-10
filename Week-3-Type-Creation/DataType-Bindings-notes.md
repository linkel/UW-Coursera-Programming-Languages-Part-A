## Constructs

We can create our own compound types! 

They are either
1. Each-of
2. One-of
3. Self reference

Each-of types are those where their values contain each of the values of type t1, t2, ... tn. These are very common--like tuples, and many other constructions in other languages. 

One-of types are those where their values can contain one of a value of t1, t2 ... tn. Just one. 

Self reference types describe lists and trees because they contain a thing and usually itself. Like an int list contains an int, and an int list. Or else it contains nothing. So it's also a one-of type combined in a self reference with an each-of. 

## Record Types (Tuples are record types, surprise!)

Record types are each-of types where each component also has a name. 

{ barrelLength: int, ammoCapacity: int, isFunctional: bool }

This is a record type. Like how tuples will use #1 THINGY and #2 THINGY to refer to a (something, somethingElse), a record would be done like barrelLength rifle or ammoCapacity rifle to get those named field keys. 

Tuples are syntactic sugar for records with fields named 1, 2, ... n

## Datatype bindings

datatype myType = TwoInts of int*int
                | Str of string
                | Pizza

Here this myType is a new type we defined where values have an int*int or a string or nothing. Each tag "TwoInt" for example is a constructor! You can use two constructors to tag the same type of underlying data, too. 

A constructor is either a function for making new values of this type or it is a value for that type. So here TwoInts and Str are functions. TwoInts has type int*int->myType. Str has type string->myType. Pizza is a value of type myType. 

The result that happens from the function calls we make will KNOW which variant they are! They'll carry a tag. REPL will show TwoInts(3,4) or Str "doodlyboodle".

## How do we get access to datatype values??

CASE EXPRESSIONS! 

They're kind of like conditionals. They also kind of let you do overloading. Too crazy. 

They're sort of like switch cases. Maybe I should stop thinking of them in terms of other things...

datatype rank = Jack | Queen | King | Ace | Num of int


## Type Synonyms

Type synonyms are NOT datatypes. They're just a way to make it easier to refer to a type. So if I did

type thing = int * bool

I can write thing whenever I mean int * bool. Datatype bindings however create constructors that produce values of that new type. 

