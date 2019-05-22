## ANONYMOUS ...functions

Lecture starts off with an example.

fun triple x = 3*x
fun triple_n_times (n, x) = n_times(triples, n, x)

A function at top level unnecessarily is meh. 

He says this style is not as good as just slipping the triple inside triple n times, because it doesn't make much sense to stick the helper function outside of the triples n times function since it's the only one using it. Owch. I did a lot of this in previous assignments...

So he turned it into

fun triple_n_times (n,x) =
    let
        fun triple x = 3*x
    in
        n_times(triple,n,x)
    end

Lecturer says you can stick triple inside that n_times, since that's all where it's being used. Bear with me...

fun triple_n_times (n,x) =
    n_times(let fun triple x= 3*x in triple end, n, x)

Look at that! That's the only place we use this. It's proof that it's the only place we need this. 

What's the final step? We can't just remove all the lets and ends because fun triple x = 3*x is a binding, not an expression. IE

THIS DOESN'T WORK YET

fun triple_n_times (n,x) =
    n_times(fun triple x = 3*x, n, x)

So what's the right syntax? You make it an anonymous function by writing fn, and using the thick arrow syntax, removing the names for stuff. 
fun triple_n_times (n,x) =
    n_times((fn x => 3*x), n, x)

Mini Quiz: what's the syntax for anonymous function?
ex: 
fn x => x*2

## Recursion tho

Can't use anon function for recursion, since it doesn't have a name. 

If not for recursion, fun bindings would be syntactic sugar for val bindings and anonymous functions

## HW problem 1

Why was that so confusing? List.filter first takes a parameter that is a function that it will apply to a list item which if returns true it'll keep. So you give it that first param and then you feed it the next param which is the list itself. It curries. It operates on the first param you gave it and this returns a function that you can then feed the parma of the list. 

String.sub takes a tuple s and i, where s is the string and i is the index starting from 0. Char.isUpper takes a character and returns a bool telling you if it's true or false. 

I got tripped up by forgetting to stick in the index into String.sub and then not writing out the contents for list filter correctly--I made it a tuple of the anon function and the string list when it really just wants the one param of the anon function and then the second param of the string list, no commas making it a tuple. 

