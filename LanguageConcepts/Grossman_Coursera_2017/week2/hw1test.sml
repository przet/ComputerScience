(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1_penny.sml";

(* Tests for Question 1 *)
(*
val Q1test1 = is_older ((1,2,3),(2,3,4)) = true (* a simple, initial test *)
val Q1test2 = is_older ((1,2,3),(1,2,3)) = false  (* if the two dates are the
same, then the result should be false (and hence this should evaluate to true in
  the REPL, that is it is true that this is false *)

val Q1test3 = is_older ((1,2,1),(1,2,2)) = true (* same year, month, diff day *)
val Q1test4 = is_older ((2,3,4),(1,2,3)) = false (* reverse of test1 *)
val Q1test5 = is_older ((1,3,1),(1,2,1)) = false (* diff month *)
val Q1test6 = is_older ((1,2,1),(1,3,1)) = true (* reverse test 5 *)
val Q1test7 = is_older ((1,2,1),(2,2,1)) = true (* earlier year (first arg) *)
val Q1test8 = is_older ((1,2,1),(2,2,4)) = true (* variation of test7 *)
val Q1test9 = is_older ((1,2,1),(2,1,1)) = true (* another variation of test7 *)
val Q1test10 = is_older ((1,2,1),(2,1,4)) = true (* yet another variation of test7 *)
*)

(* Tests for Question 2 *)
(*
val Q1test1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val Q1test2 = number_in_month ([(2012,3,28),(2013,12,1)],2) = 0
val Q1test3 = number_in_month ([(2012,12,28),(2013,12,1)],12) = 2
val Q1test4 = number_in_month ([],12) = 0
*)

(* Tests for Question 3 *)
(*
val Q3test1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val Q3test2 = number_in_months
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[8,11,10]) = 0
val Q3test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val Q3test4 = number_in_months
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,1,12,8,9]) = 3
*)

(* Tests for Question 4 *)

val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

(*

val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test9 = what_month 70 = 3

val test10 = month_range (31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

*)
