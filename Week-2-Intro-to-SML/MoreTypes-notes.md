## Tuples

Something kinda interesting...

Tuples are just something written inside parentheses separated by commas. They can be different types. 

(int, bool) like (5, false)

You can use hash or pound sign to indicate the position of the pair you're talking about. 

fun swap (pr : int*bool) =
    (#2 pr, #1 pr) 

This above function is just swapping the position of what you pass in. So (5, false) becomes (false, 5).

I tested it in my REPL just to make sure.

```
val it = 1 : int
- fun swap (pr: int*bool) =
= (#2 pr, #1 pr)
= ;
val swap = fn : int * bool -> bool * int
- swap(5, true);
val it = (true,5) : bool * int
```

Pretty neat! Note that the type of the function was shown: int * bool -> bool * int

### How does SML know I'm passing it pairs and not two arguments? 

Uh, pairs and two arguments are actually the same thing, apparently. 

Okay, so a tuple can have more than just two parts. Can go on! 

(4,5,6,7,2)

Can nest them!

((4,2),(3,5))

## Nesting

val x1 = (7, (true,9))

Okay, easy, that's a int * (bool * int).

val x2 = #1 (#2 x1)

Wat! So you take the 2nd piece in x1, which is (true, 9), and then we do

`#1 (true, 9)`

which returns us true. So the type of that expression there is a bool.

val x3 = (#2 x1)

Now we're grabbing the second of x1 without doing more stuff, so it's just (true, 9) which is (bool*int)

And the other guy he shows is just triply nested. 

## Tuples Question

What's the type of ans?

𝚟𝚊𝚕 𝚡 =(𝟹,(𝟺,(𝟻,𝟼)));
𝚟𝚊𝚕 𝚢 =(#𝟸𝚡,(#𝟷𝚡,#𝟸(#𝟸𝚡));
𝚟𝚊𝚕 𝚊𝚗𝚜 =(#𝟸𝚢,𝟺);

Well, okay. X is triply nested. 

Taking pen to paper...

We know y is `((𝟺,(𝟻,𝟼)),(𝟺,(𝟻,𝟼)))`

So ans is `((𝟺,(𝟻,𝟼)),4)`

Therefore it's the (int * (int * int)) * int

## Lists

So we saw that tuples have to commit to some amount of data. What if we want to have any number of elements? 

We got lists! But lists need to be of the same type. 

## cons

If I've got a list
[4, 5, 6, 7]
Then if I do
5 :: [4, 5, 6, 7]
I get [5, 4, 5, 6, 7]

Can't do
[5] :: [4, 5, 6, 7] because I'm trying to stick a int list inside of an int list. I could make an int list list and stick an int list in though. 

## null, hd, and tl

null is a function that will return true if and only if a list is empty! 

- null [];
val it = true : bool

hd will give you back the first item in the list, and an exception if list is empty. tl gives back the rest of the list after the first element. That is, the tail of a list is a list containing all elements of the original list except the list's first element. 

You could do tl(tl(tl([4,5,6,7]))) to get back [7]. So remember, tail is giving back the rest of it in the form of a list! 

Tail of a one element list is an empty list! 

Mini question: how to access the third element (6) in this list: 
x = [5,1,6,8] 
via calls to hd and tl?

val el = hd(tl(tl(x)))

## Type-checking list operations

Well, we've got all these new types now that we have lists...like an int list, bool list, tuple lists (int * int) list, etc. This goes on! 

SML uses type 'a list (quote a or alpha) to indicate an empty list, since it can be of any type. 

For the cons operator to type check, we need e1 to have type t and e2 to have type t list. e1 :: e2

null just gets an alpha list and gives you back a bool.
hd gets an alpha list and gives you back the alpha.
tl gets an alpha list and gives you back the alpha list. 


