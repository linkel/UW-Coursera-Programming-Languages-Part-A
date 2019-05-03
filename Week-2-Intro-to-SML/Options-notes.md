## Options

t option is a type for any type t

NONE has type 'a option
SOME e has type t option if e has type t

isSome has type 'a option -> bool
valOf has type 'a option -> 'a (exception if given NONE)

I need to revisit this. This is for throwing exceptions and returning NONE instead of 0 for certain functions. 

## Revisiting

So an option is something that has either 0 or 1 thing. It has a couple of option values. NONE is an option value that has nothing, and SOME e evaluates e to a value and then becomes an option that carries that one value, v. Hence NONE is the type of anything option, or 'a option, and the type of SOME e is t option if e has type t, since if it's got something in it that thing has got a certain type. 

isSome evals to false if the argument is NONE. valOf will grab the option's value assuming the option has something (therefore it is SOME) and it will raise an exception instead for NONE. 

So to find the max of something, you can do

fun better_max2 (xs : int list) =
    if null xs
    then NONE
    else let (* fine to assume argument nonempty because it is local *)
        fun max_nonempty (xs : int list) =
        if null (tl xs) (* xs must not be [] *)
        then hd xs
        else let val tl_ans = max_nonempty(tl xs)
            in
                if hd xs > tl_ans
                then hd xs
                else tl_ans
            end