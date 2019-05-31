## First try: 71.5%, alas. Poor understanding of struct and signature.

1. Check a box if and only if it is an accurate description of ML. 

- Function arguments are evaluated before being passed to functions. True! SML evals them as part of type checking, I think. Gotta see if it's the right fit for the function. 

- ML is dynamically scoped. False. It's lexically scoped. Dynamic scoping is pretty rare--it means that scope is dependent on how the code executes. But in SML you can see that in the let blocks, the scope of variables declared within them stays in them. This is true for a lot of other languages--like if I were to write something in Python in a function scope then something in a global scope, that's lexical scoping because it's dependent on how the code is written. Same dealio for JavaScript. It's how the closures and shit work. 

- All functions can be called recursively. Uhh, I answered this true. Can they not be? 

- Functions are first-class expressions. True. You can pass functions into functions and do whatever you like with them. 

2. Check a box if and only if it is an example of unnecessary function wrapping. 

There's only one obvious choice here!

3. Check this box if true regarding this code. A lexical scoping understanding question. 

```
1-   val x = 50
2-   val y = 3
3-   val z = 10
4-   val f = fn z => z
5-   val a = 
6-   let 
7-     val x = 3*x
8-     val z = y*z
9-   in
10-    x*z
11-  end
12-  fun f x z = x + y + z
13 - 
```

- On line 4, the variable z is bound to 10. Nope, it is not. It's in an anonymous function. Got nothing to do with the val z outside. 

- On line 7, x is bound to 150. Yes. 

- On line 8, z is bound to 30. Yep.

- On line 10, z is bound to 10. No, this z is bound to 30. It's in the function scope after the let declarations. 

- On line 12, the variable x inside the function body is bound to 50. I messed up, I answered yes but upon looking at it, the function takes an x. So it wouldn't be. I think the y would be, though, since it doesn't take it, and instead uses the scope it's in. 

- On line 12, the variable y inside the function body is bound to 3. Yep, what I said above. 

- On line 13, x is bound to 50. Yep, that x never got shadowed. 

4. Check the box iff type is valid type. 

```
fun foo f x y z = 
	if x >= y
	then (f z)
	else foo f y x (tl z)
```

(int -> real) -> int -> int -> int -> real

NOPE. The fact that tl z is there means z is a list. f z then is a function acting on a list. It isn't acting on an int. 

(string list -> bool list) -> int -> int -> string list -> bool list

YES. The type that results from f z is also the final type in the whole function. 

('a list -> 'b list) -> int -> int -> 'a list -> 'b list

YES, same as explanation above. Types are more general here. 

(int list -> 'b list) -> int -> int -> 'b list -> int list

No, the ending type of the whole function here doesn't match up with the 'b list type of what results from f z. 

('a list -> string list) -> int -> int -> 'a list -> 'a option list

No, same explanation as above. 

5. Check box iff tail call. 

I need work on figuring out what's a tail call or not. Got one wrong. 

```
fun factorial i = 
let 
  fun factorialhelper (start,i) = 
    if start <> i
    then start * factorialhelper (start+1, i)
    else start 
in 
  if i=0
  then 1
  else factorialhelper (1,i)
end 
```

I said this was a tail call but it isn't. Will ponder on it. I was going off a heuristic where if it had let and in blocks it was probably more likely a tail call but obviously I have to actually think about this.  

6. Partial application, currying. Got this entirely wrong. 

7. maybeEven maybeOdd. I'm convinced there's a typo for "the call maybeOdd 1 does not terminate" -- doesn't it terminate with a true? Tried it in my IDE and it also terminated in true. That is the only one I got wrong for this question.

```
fun maybeEven x = 
	if x = 0 
	then true
	else
	if x = 50
	then false
	else maybeOdd (x-1)

and maybeOdd y =
	if y = 0
	then false
	else 
	if y = 99
	then true
	else maybeEven (y-1)
```

8, 9, and 10 were type questions that were quite trivial.

11. ML signature DIGIT with a structure definition DIGIT. I skipped the lecture on this, my mistake. Need to read up on this before I understand what is going on. 

