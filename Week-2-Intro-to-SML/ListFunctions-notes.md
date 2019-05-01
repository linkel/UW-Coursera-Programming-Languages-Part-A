## Functions over lists

We can write functions that operate over lists.

fun sum_list (xs : int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs)

This function will add all the ints in a list together. It does it by grabbing the head and adding it to the result of itself taking in the param of the rest of the list. Which then would be the head of that rest of the list, and so on until it used it all up, i.e., once it's null it returns a 0. 

How might we write a function that takes a product of a list?

fun prod_list (xs : int list) =
    if null xs
    then 1
    else hd xs * prod_list(tl xs)

## Appending

fun append (xs : int list, ys : int list) =
    if null xs
    then ys
    else (hd xs) :: append((tl xs), ys)

Interesting. So we have to take that piece out of the list and cons it into the second list until it's all gone. Consing is the fundamental function we're provided with to put items into lists, and so if we're combining two lists together we have to take the bits out of that list and cons it into the other list. 

## Recursion

So as I've noticed, most of the functions to do with lists (all, really) are recursive. It's how we get to all the elements!

It's good to think about this:

1. What should the answer be for the empty list? (BASE CASE)
2. What should the answer be for the non empty list? (in terms of the answer for the tail of the list, usually)
