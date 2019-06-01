## First try got 72.23, alas. 

## Second try 78.23 notes below:

1. Check a box iff accurate description of ML. 

- ML uses lexical scope for semantics of looking up vars in environment -- I think this is true.
- ML has no language constructs for creating mutable data. I think this is true...I thought maybe you could, but maybe not. 
- ML has a repl as part of the language. Yeah, it does. Right? I've been using this sml buffer in emacs. 
- ML is statically typed. Yep. 

2. [(4, 19), (1, 20), (74, 75)] For each pattern below, check the box iff this pattern matches the value above.

- x :: y - isn't this right? It's a thing and a rest of a thing. 
- x :: (y :: z) - not sure. Maybe it is, since it's a thing with another thing that's from the rest of a thing. 
- (a,b,c) :: d - I don't think so. No triple tuple here. 
- [] - It's not empty so no, right?
- (a,b)::(c,d)::(e,f)::[] - I think this is true.
- (a,b)::(c,d)::(e,f)::g - it's an empty list at the end so it isn't this. 

3. Check the box iff the statement is true regarding this ML code:

```
fun mystery f xs =
    let
        fun g xs =
           case xs of
               [] => NONE
             | x::xs' => if f x then SOME x else g xs'
    in
        case xs of
            [] => NONE
          | x::xs' => if f x then g xs' else mystery f xs'
    end
```

- mystery uses currying to take two arguments - yes
- mystery uses tupling to take two arguments - I don't think it is
- If the second argument to mystery is a zero element list, then whenever mystery produces a result, the result is NONE - I think so.
- If the second argument to mystery is a one element list, then whenever mystery produces ar esult, the result is NONE - I thought it was.
- If the second argument to mystery is a two element list, then whenever mystery produces a result, the result is NONE - I don't think so...
- Argument type of f can be any type, but it must be the same type as the element type of xs - this isn't true, right? 
- Result type of f can be any type, but it must be the same type as the element type of xs - I don't think so, I think it's gotta be a boolean
- If you replace the first line of the code with fun mystery f = fn xs =>, then some callers of mystery might no longer type-check. - I thought it wouldn't matter since it's equivalent. Might be something I'm missing. 
- If you replace the first line of the code with fun mystery f = fn xs =>, then some callers of mystery might get a different result. - I didn't think so. 
- g is a tail recursive function - I don't think it is, but not sure. 
- For the entire computation of a call like mystery someFun someList, the total number of times someFun is called is always the same as the length of someList - if you call it with empty list, f doesn't get called. 
- For the entire computation of a call like mystery someFun someList, the total number of times someFun is called is sometimes the same as the length of someList - I think this is true
- For the entire computation of a call like mystery someFun someList, the total number of times someFun is called is never the same as the length of someList. I don't think this is true, since you could call it with 2 things where the second item matches right? so f gets called twice. 

4. Null function is predefined in ML's stdlib, but we can define it ourselves. For each suggested definition of null below, check the box iff the function would behave the same as the predefined null function whenever the function below is called. Only consider situations where calls to the fn below type-check. 

funnullxs=casexsof[]=>true|_=>false


\verb|fun null xs = xs=[]|funnullxs=xs=[]


\verb|fun null xs = if null xs then true else false|funnullxs=ifnullxsthentrueelsefalse


\verb|fun null xs = ((fn z => false) (hd xs)) handle List.Empty => true|funnullxs=((fnz=>false)(hdxs))handleList.Empty=>true

I picked the first three here. 

5. The next four questions, including this one, relate to this situation: Suppose somebody has written a library for a collection of strings (perhaps implemented as some sort of linked list of strings or tree of strings, but the details do not matter). The library includes higher-order functions map, filter, and fold that operate on these collections and have their conventional meanings. For each problem below, decide which of these library functions is the best to use for implementing the desired function.

(For those needing a precise definition of best: On this exam, the best function, given appropriate arguments, returns the final result you need, meaning you need no more computation after calling the function. If multiple functions can do this, choose the one that can be used by passing it the function argument that itself does the least amount of work.)

Desired function: Take a collection of strings and produce a new collection where each string in the output is like a string in the input except the string has any space characters removed.

MAP

6. Desired function: Take a collection of strings and return a string that is the concatenation of all the strings in the collection.

FOLD

7. Desired function: Take a collection of strings and a number n and return how many strings in the collection have a length that is a multiple of n.

FOLD

8. Desired function: Take a collection of strings and return a collection containing the strings in the input collection that start with a capital letter.

FILTER (did I select this wrong? that's definitely filtering, but it marked me wrong)

9. We're representing some equations from algebra.

```
datatype algebra_exp = Variable of string
                     | Integer of int
                     | Decimal of real
                     | Addition of algebra_exp * algebra_exp
                     | Multiplication of algebra_exp * algebra_exp
                     | Exponent of algebra_exp * int
type equation = algebra_exp * algebra_exp
```

Which of the eq below could not be elegantly represented by a value of type equation?

There's only one obvious choice! x to the power of y equals z, because exponentiation here takes an expression and an int, not two expressions. So it can't do two variables.  

10. Here's a particular polymorphic type in ML: 
'a * 'b -> 'b * 'a * 'a

Check the box iff the type is an instantiation of the type above, which means the type above is more general. 

The first time I went through this I selected string*int -> string * int *int and the typed curly braces thing, but I think that was wrong since that was actually a record, so it was like an a -> b type. 

Still picking the first of that one, but also picking the all ints one and the all as one. I'm seriously not sure since I got this one super wrong. 

11. Given a ML struct definition NoNegativeCounter and different signatures COUNTER, answer the questions about what it enables or prevents. 

```
structure NoNegativeCounter :> COUNTER = 
struct

exception InvariantViolated

type t = int

fun newCounter i = if i <= 0 then 1 else i

fun increment i = i + 1

fun first_larger (i1,i2) =
    if i1 <= 0 orelse i2 <= 0
    then raise InvariantViolated
    else (i1 - i2) > 0

end
```

First one for question 11:

```
signature COUNTER =
sig
    type t = int
    val newCounter : int -> t
    val increment : t -> t
    val first_larger : t * t -> bool
end
```

This signature allows some clients to cause the invariantviolated exception to be raised, because it tells the type as int, and you can then call first larger with negative values. 

12.

```
signature COUNTER =
sig
    type t = int
    val newCounter : int -> t
    val first_larger : t * t -> bool
end
```

This one hides increment, but it still allows it to raise the exception since the type is still exposed. 

13.

```
signature COUNTER =
sig
    type t
    val newCounter : int -> int
    val increment : t -> t
    val first_larger : t * t -> bool
end
```

This finally abstracts the type t, but you actually can't call anything because you need a t and can't make it with new Counter since it makes ints. So it makes it impossible to call first_larger. 

14. 

```
signature COUNTER =
sig
    type t
    val newCounter : int -> t
    val increment : t -> t
    val first_larger : t * t -> bool
end
```

This signature does good! Now you can call first_larger but can't violate the exception. 

15. 

```
signature COUNTER =
sig
    type t = int
    val newCounter : int -> t
    val increment : t -> t
end
```

This one takes away first_larger so clients can't actually call it. 

## Third try: 83.61

Damn, it must have been that ML really doesn't have mutable types. 

Also, it does seem that the function in problem 3 can take any arg but needs to have the type of it be the same as xs. 

I got less right on the null function problem. Must have indeed misclicked for the problem involving filter. Still only 6/10 on the polymorphic types questions...I clearly lack some understanding about what counts as a valid instantiated type. Dang! 