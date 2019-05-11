## Tail Recursion

Lecture gives two examples of code. One looks simpler because it doesn't make use of a helper function.

fun sum1 xs =
    case xs of
        [] => 0
        | i :: xs' => i + sum1 xs'

The other has a helper function inside it.

fun sum2 xs =
    let fun f (xs, acc) =
        case xs of 
            [] => acc
            | i :: xs' => f(xs', i+acc)
    in
        f(xs, 0)
    end

The base case in the first one becomes the accumulator, and the base case in the second one just returns the accumulator. 

Why is the second one preferred?

For every function call that's started but not completed, there's an element for it in the call stack. It holds info about local variable values and what part of the function has not been eval'd yet. 

For sum1, there's one call-stack element or stack frame for each recursive call to sum1. So the stack will be as big as the list. After every stack frame gets popped the caller goes to the rest of it, to add i to the result and return.

For sum2, it does the same thing until the function makes a recursive call to itself, because it's done! It just returns. This is called a tail call. When you make a tail call, the stack-frame gets popped before the call and the callee's stack frame just replaces the caller's, because the caller was just gonna return the callee's result. Calls to sum2 NEVER use more than 1 stack frame. Yo! 

When you do this in languages that have this optimization, recursion can be as efficient as a while loop, and the call stack gets no bigger. 

Tail calls don't have to be to the same function, so you've got a flexibility that may not exist with while loops that have to call the same loop. Accumulators help a lot for turning a regular recursive fn to a tail recursive fn. 


