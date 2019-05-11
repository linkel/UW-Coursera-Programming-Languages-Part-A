(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option (s, []) = NONE
  | all_except_option (s, x :: xs) =
    case same_string(s, x) of
	true => SOME xs
      | false => case all_except_option(s, xs) of
		     NONE => NONE
		   | SOME y => SOME (x :: y)

fun get_substitutions1 (str, []) = []
  | get_substitutions1(str, lst :: rest) =
    case all_except_option(str, lst) of
	NONE => []
      | SOME thing  => case get_substitutions1 (str, rest) of
			   [] => thing
			 | stuff  => thing @ stuff
						 
fun get_substitutions2 (str, lst) =
    let fun helper (str, [], concat) = concat
	  | helper (str, lst :: rest, concat) =
	    case all_except_option (str, lst) of
		NONE => helper (str, rest, concat)
	      | SOME thing  => helper (str, rest, thing @ concat)
    in helper (str, lst, [])
    end
							 
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
