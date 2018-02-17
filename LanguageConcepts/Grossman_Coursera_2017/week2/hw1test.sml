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
val Q2test1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val Q2test2 = number_in_month ([(2012,3,28),(2013,12,1)],2) = 0
val Q2test3 = number_in_month ([(2012,12,28),(2013,12,1)],12) = 2
val Q2test4 = number_in_month ([],12) = 0

(* Tests for Question 3 *)
val Q3test1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val Q3test2 = number_in_months
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[8,11,10]) = 0
val Q3test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val Q3test4 = number_in_months
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,1,12,8,9]) = 3

(* Tests for Question 4 *)
val Q4test1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val Q4test2 = dates_in_month ([(2012,2,28),(2013,12,1), (2015,2,4)],2) =
  [(2012,2,28),(2015,2,4)]
val Q4test3 = dates_in_month ([(2012,1,28),(2013,12,1), (2015,2,4)],2) =
  [(2015,2,4)] 
val Q4test4 = dates_in_month ([(2012,2,28),(2013,12,1), (2015,2,4)],1) = []

(* Tests for Question 5 *)

val Q5test1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val Q5test2 = dates_in_months
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4,3,2]) =
[(2011,4,28),(2011,3,31),(2012,2,28)]  (*Note it will fail the oringal order
test (which is NOT explicitly asked for in THIS question*)

(* Tests for Question 6 *)
val Q6test1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val Q6test2 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"
val Q6test3 = get_nth (["hi", "there", "how", "are", "you"], 3) = "how"
val Q6test4 = get_nth (["hi", "there", "how", "are", "you"], 7) = "string list is empty"
(* we are told not to worry about the case when the list has too few
elements, hence expected result of test 4 *)
val Q6test5 = get_nth ([], 3) = "string list is empty"

(* Tests for Question 7 *)
val Q7test1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val Q7test2 = date_to_string (1991, 3, 25) = "March 25, 1991"

(* Tests for Question 8 *)
val Q8test1 = number_before_reaching_sum (10, [1,2,3,4,5])= 3 
val Q8test2 = number_before_reaching_sum (15, [2,5,1,2,9,8,7]) =4
val Q8test3 = number_before_reaching_sum (4, [1,4])  =1 (* Testing that the 2
element list case works corectly *)
val Q8test4 = number_before_reaching_sum (8, [1,2,3,4,5])  =3

(* Tests for Question 9 *)

val Q9test1 = what_month 70 = 3
val Q9test2 = what_month 33 = 2
val Q9test3 = what_month 80 = 3
val Q9test4 = what_month 59 = 2
val Q9test5 = what_month (59 + 31) = 3
val Q9test6 = what_month (59 + 31+30) = 4
val Q9test7 = what_month (59 + 31+14) = 4
val Q9test8 = what_month (365) = 12

(* Tests for Question 10 *)
val test10 = month_range (31, 34) = [1,2,2,2]

(* Tests for Question 11 *)
val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)])  = SOME (2011,3,31) 

(*
Challenge Problems*)

(* Tests for Question 12 *)
val Q12test1 = remove_duplicates ([2,3,4,3]) = SOME([2,3,4]) 
