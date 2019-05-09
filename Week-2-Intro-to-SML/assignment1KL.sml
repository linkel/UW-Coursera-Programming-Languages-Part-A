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
    else false (* is this seriously the way to write it? Looks awful! There must be something more elegant *)

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
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)
							    
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

fun month_range (day1: int, day2: int) =
    let fun month_helper (curr: int, final: int, month_list: int list) =
	    if curr > final
	    then month_list
	    else month_helper (curr, final-1, what_month(final) :: month_list)
    in month_helper(day1, day2, [])
    end
	
	(* my incorrect interpretation of month_range
fun month_range (day1: int, day2: int) =
    let val month1 = what_month(day1)
	val month2 = what_month(day2)
	fun month_helper (curr: int, final: int, month_list: int list) =
	if curr > final
	then month_list
	else month_helper(curr, final-1, final :: month_list)
    in month_helper(month1, month2, [])
    end
*)
	
fun oldest (dates: (int*int*int) list) =
    if null dates
    then NONE
    else let fun oldest_nonempty (dates : (int*int*int) list) =
		 if null (tl dates)
		 then hd dates
		 else let val tl_ans = oldest_nonempty(tl dates)
		      in
			  if is_older(hd dates, tl_ans)
			  then hd dates
			  else tl_ans
		      end
	 in
	     SOME (oldest_nonempty(dates))
	 end

fun number_in_months_challenge (dates : (int*int*int) list, months : int list) =
    let fun months_cleaner [] = []
	  | months_cleaner (x :: months : int list)  = 
	    let fun delete (x , []) = []
		  | delete (x : int, y :: l : int list)  = 
		    if x = y
		    then delete (x, l)
		    else y :: delete (x, l)
	    in	x :: months_cleaner(delete(x,months))
	    end
    in number_in_months(dates, months_cleaner(months))
    end

fun dates_in_months_challenge (dates: (int*int*int) list, months : int list) =
        let fun months_cleaner [] = []
	  | months_cleaner (x :: months : int list)  = 
	    let fun delete (x , []) = []
		  | delete (x : int, y :: l : int list)  = 
		    if x = y
		    then delete (x, l)
		    else y :: delete (x, l)
	    in	x :: months_cleaner(delete(x,months))
	    end
	in dates_in_months(dates, months_cleaner(months))
	end
	  	     
fun check_year (year: int) =
	year > 0
	
fun check_month (month: int) =
	month > 0 andalso month <= 12
	
fun days_in_month (month: int, year: int) =
        let val leap  = year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0)
            val curse_you_feb = if leap then 29 else 28
	    val month_days = [31,curse_you_feb,31,30,31,30,31,31,30,31,30,31]
		fun days_helper (month: int, month_list: int list, index: int) =
			if index = month
			then hd month_list
			else days_helper(month, tl month_list, index + 1)
	in days_helper(month, month_days, 1)
	end

fun check_day (day: int, month: int, year: int) =
	day > 0 andalso day <= days_in_month (month, year)

fun reasonable_date (date: int*int*int) =
	check_year(#1(date)) andalso check_month(#2(date)) andalso check_day(#3(date), #2(date), #1(date))
			       
