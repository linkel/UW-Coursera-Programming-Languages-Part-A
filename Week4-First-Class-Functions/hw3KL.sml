(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)
fun only_capitals (sl : string list) =
    List.filter(fn x => Char.isUpper(String.sub(x,0))) sl

fun longest_string1 (sl : string list) = 
   List.foldl (fn (s, longest_so_far) => if String.size(s) > String.size(longest_so_far) then s else longest_so_far) "" sl
   

fun longest_string2 (sl : string list) = 
   List.foldl (fn (s, longest_so_far) => if String.size(s) >= String.size(longest_so_far) then s else longest_so_far) "" sl

fun longest_string_helper (f) =
    fn sl => List.foldl (fn (s1, s2) => if f(String.size(s1), String.size(s2)) then s1 else s2) "" sl

val longest_string3 = fn sl => longest_string_helper (fn (x, y) => x > y) sl

val longest_string4 = fn sl => longest_string_helper (fn (x, y) => x >= y) sl

val longest_capitalized = longest_string1 o only_capitals
						
val rev_string = String.implode o List.rev o String.explode

fun first_answer (f) = fn al => case al of
				    [] => raise NoAnswer
				  | stuff :: stuffs => case f stuff of
							  SOME v => v
						       | NONE => first_answer f stuffs
fun all_answers (f) =
    let fun helper (f, item, acc) =
	case item of
	    [] => SOME acc
	  | i :: is => case f i of
			   NONE => NONE
			| SOME ls => helper(f, is, [ls] @ acc) 
    in fn al => helper(f, al, [])
    end
	
fun count_wildcards (pat) =
    g (fn () => 1) (fn str => 0) pat

fun count_wild_and_variable_lengths (pat) =
    g (fn () => 1) String.size pat

fun count_some_var (s, pat) =
    g (fn () => 0) (fn str => if s = str then 1 else 0) pat

fun check_pat (pat) =
    let fun stringlister (pat) =
	    case pat of
		Variable s => [s]
	      | TupleP ts => List.foldl (fn (t, item) => (stringlister t) @ item) [] ts
	      | ConstructorP (_, t) => stringlister t
	      |  _ => []
	fun repeats sl =
	    case sl of
		[] => false
	      | x :: xs => if List.exists (fn y => x = y) xs then true else repeats (xs)
	val checker = not o repeats o stringlister
    in
	checker pat
    end

(* Wasn't able to do enough this week... *)
