## Options

t option is a type for any type t

NONE has type 'a option
SOME e has type t option if e has type t

isSome has type 'a option -> bool
valOf has type 'a option -> 'a (exception if given NONE)

I need to revisit this. This is for throwing exceptions and returning NONE instead of 0 for certain functions. 