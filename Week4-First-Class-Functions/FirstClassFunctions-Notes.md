## You can do stuff like you do with values with functions!

Stick them in tuples!

you can have a doubling function, an incrementing function, and stick them into 

val a_tuple = (double, incr)

And you could use it on stuff, like

(#1 a_tuple) 123 ===> 246

If a function is used as an argument of another function it is a first-class function. 

## Closures

Remember JavaScript's closures! 

Functions can use bindings from outside the function definition, within the scope when there function is defined! This is some functional programming shizzle. 

## Polymorphic Types

Okay, so there's something called polymorphic types. Just means can be multiple types. It's a separate concept--orthogonal--from higher order functions. You can have polymorphic non higher order functions. 

Like in the example, the n_times function that takes a function and executes it 10 times on a thing, you could give it specific int types only. But then you wouldn't be able to use it on something that doesn't have ints! So really having the type be alpha 'a is better, because now you can use it on more things.

The type gets inferred by the arguments. 

Mini quiz! Which function has the type 'a -> 'a?

Out of the four choices, only one of them keeps its own type...the function4 x = x. 

## Polymorphism is orthogonal to higher-order functions

Lecture shows a times_until_zero function that is a higher order function that's not polymorphic because it's specifically for ints. 

Also shows a function len that gives you the length of a list, and it's polymorphic while not being higher-order. Makes sense!