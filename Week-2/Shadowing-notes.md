### Shadowing

Multiple variable bindings of the same variable! Usually poor style to do this. 

so val a = 5 in ML is not an assignment statement. BEWARE! 

val a = 10

okay, a's 10...

val b = a * 2

and now b is 20...

val a = 5

a is now 5, sure. But b is STILL 20 right here, because that was calculated back when aw as 10! 

val c = b

This is going to be 20. 
Does that make sense? Keeps the "order". So all these new environments, we have a shadowing the previous a. 

val d = a

And we've got a d now.

val a = a + 1

now we shadow a again! It's 6 now. 

val f = a * 2

And now f is 12. 

SML gives you a <hidden-value> to tell you that something got shadowed, when you look at it in the REPL. 

Expressions get evaluated eagerly! And you don't assign to variables in ML, you just shadow 'em. I wonder if this means that the reference is different each time? Probably. 

## Don't reuse USE

This shadowing is the reason why you shouldn't reuse USE, in case it shadows! Just exit it and enter again. 