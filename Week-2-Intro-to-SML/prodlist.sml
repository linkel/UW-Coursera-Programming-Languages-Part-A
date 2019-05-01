fun prod_list (xs : int list) =
    if null xs
    then 1
    else hd xs * prod_list(tl xs)

fun silly2 () =
    let
	val x = 1
    in
	(let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
    end
	
