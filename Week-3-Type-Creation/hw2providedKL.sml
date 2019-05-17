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
				    
(* this doesn't seem to be functioning quite right *)
fun get_substitutions1 ([], str) = []
  | get_substitutions1(lst :: rest, str) =
    case all_except_option(str, lst) of
	NONE => []
      | SOME thing  => case get_substitutions1 (rest, str) of
			   [] => thing
			 | stuff  => thing @ stuff
						 
fun get_substitutions2 (lst, str) =
    let fun helper (str, [], concat) = concat
	  | helper (str, lst :: rest, concat) =
	    case all_except_option (str, lst) of
		NONE => helper (str, rest, concat)
	      | SOME thing  => helper (str, rest, thing @ concat)
    in helper (str, lst, [])
    end

type fullname = {first: string, middle: string, last: string}

		    (* this is not coming out with original name first, it is backwards *)
fun similar_names (substitutions, name : fullname) =
    let val sub_list = get_substitutions2(substitutions, #first (name))
	fun helper([], name : fullname, accum) = accum
 	  | helper(x::xs, name, accum) =
	    helper(xs, name, {first = x, middle = #middle (name), last = #last (name)} :: accum)
    in helper(sub_list, name, [name])
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
	      

(*not quite right *)
	      
fun card_color (c: suit*rank) =
    case c of
	(Clubs, _) => Black
      | (Spades, _)  => Black
      | (_, _) => Red
		      
	
fun card_value (c: suit*rank) =
    case c of
        (_, Ace) => 11
      | (_, Num n) => n
      | (_, _)  => 10
 		       
fun remove_card ([], c: card, e) = raise e
  | remove_card (x :: cs, c, e) =
    case x=c of
	true => cs
     |  false  => x :: remove_card (cs, c, e)
		    
fun all_same_color (c::cs) =
	let val starter = card_color(c)
		fun helper ([]) = true
		| helper (x :: xs) =
		case card_color(x) = starter of
			false => false
		      | true => helper(xs)
	in helper (cs)
	end
	    
fun sum_cards (cs: card list) =
    let fun helper (cs, acc) =
	    case cs of
		[] => acc
	      | c :: cs' => helper (cs', card_value(c) + acc)
    in
	helper (cs, 0)
    end
	
val sum_cards_test = sum_cards ([(Spades, Ace), (Hearts, Num 4)]) = 15;

fun score (cs: card list, goal: int) =
    let val sum = sum_cards(cs)
        val prelim = case sum <= goal of
	   true => goal - sum
	 | false => 3*(sum - goal)
    in 	case all_same_color(cs) of
	   false => prelim
	 | true  => prelim div 2
    end
	
fun officiate (cl: card list, ml: move list, goal: int) =
    let fun helper (hl: card list, cl, ml, goal) =
	case sum_cards(hl) > goal of
	    true => score(hl, goal)
	 | false => case ml of
			[] => score (hl, goal)
		      | m :: ms => case m of
				       Discard cd => helper(remove_card(hl, cd, IllegalMove), cl, ms, goal)
				     | Draw => case cl of
						   [] => score(hl, goal)
						 | c :: cs =>  helper(c :: hl, remove_card(cl, c, IllegalMove), ms, goal)
    in helper([], cl, ml, goal)
    end

fun check_num_aces (cardlist, acc) =
    let fun check_number_of_aces ([], acc) = acc
       | check_number_of_aces (c::cs, acc) = case c of
			    (_, Ace) => check_number_of_aces(cs, acc + 1)
					 | _  => check_number_of_aces(cs, acc)
in check_number_of_aces (cardlist, 0)
end
				
			                
fun score_challenge (cs, goal) =
    let 
	fun helper(cs, goal, bestscore) =
	    let val sum = sum_cards(cs)
	    case check_ace(cs) of
		0 => score(cs, goal)
	     | int n  => compare_score(score(cs, goal), n)
