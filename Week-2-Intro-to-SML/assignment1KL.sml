fun is_older (x : int*int*int, y : int*int*int) =
    if #1 x < #1 y
    then true
    else if #1 x > #1 y
    then false
    else if #2 x < #2 y
    then true
    else if #2 x > # 2y
    then false
    else if #3 x < #3 y
    then true
    else false
(* is this seriously the way to write it? Looks awful! There must be something more elegant *)	
	
