fun is_older (x : int*int*int, y : int*int*int) =
    if #1 x < #1 y
    then true
    else if #1 x > #1 y
    then false
    else if #2 x < #2 y
    then true
    else if #2 x > #2 y
    then false
    else if #3 x < #3 y
    then true
    else false
	     
	     (* is this seriously the way to write it? Looks awful! There must be something more elegant *)
fun number_in_month (dates: (int*int*int) list, month: int) =
    if null dates
    then 0
    else if (#2(hd(dates))) = month
    then 1 + number_in_month(tl dates, month)
    else 0 + number_in_month(tl dates, month)
			 
fun number_in_months (dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)
							     
fun dates_in_month (dates: (int*int*int) list, month: int) =
    if null dates
    then []
    else if (#2(hd(dates))) = month
    then hd(dates) :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)
		       
	     
	    
