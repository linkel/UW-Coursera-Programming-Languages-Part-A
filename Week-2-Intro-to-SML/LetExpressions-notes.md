## Local Variables and Let Expressions

We want to make local variables so that we can put variables inside a function and affect its internal environment (local scope, kinda). 

let b1 b2 .. bn in e end

So we need a let and we need the end, for the syntax of this. 

It gets type-checked in a static env, just like everything else, and the type of the entire expression is the type of e. 

Oh god a little bit confusing. 

fun silly2 () =
    let
	    val x = 1
    in
	    (let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
    end

This equals 7. In the first set of parentheses in the in statement, the x shadows the first x declared in let val x = 1, so the result is 3. In the second set of parentheses it operates using the environment from the let, so y + 1 is equal to 1 + 2 + 1, which is 4. 

## silly3

(15, 2, 2) is the answer to that convoluted mess! 
Glad I got that right on the first try. Looks like I understand shadowing!