## Making functions private

You do it by declaring the function in the let part of the function that will use it! 

Where can you use a local function f1 defined inside another function?

In later bindings of the let expression or the body of the let expression. 

In the countup_from function he showed, he stuck the count function inside of it and then removed the redundant variable for "to", since the "x" in the outer function would be the same as it. 

## When to use nested functions?

Use 'em when you want them to be private! If they're likely to be misused or changed. 

