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

fun dates_in_months (dates: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) :: dates_in_months(dates, tl months)
							    
fun get_nth (strings: string list, n: int) =
    let	fun get_nth_helper (strings: string list, n: int, count: int) =
	    if count = n
	    then hd strings
	    else get_nth_helper(tl strings, n, count+1)
    in get_nth_helper(strings, n, 1)
    end
	
fun date_to_string (date: (int*int*int)) =
    let val months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    in get_nth(months, #2(date))^" "^Int.toString(#3(date))^", "^Int.toString(#1(date))
    end
	
fun number_before_reaching_sum (sum: int, number_list: int list) =
    let fun num_helper (sum: int, number_list: int list, running: int, index: int) =
	    if running >= sum
	    then index - 1
	    else num_helper(sum, tl number_list, running + hd number_list, index+1)
    in num_helper(sum, number_list, 0, 0)
    end

fun what_month (day: int) =
    let val days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
    in number_before_reaching_sum(day, days_in_month)+1
    end
	
