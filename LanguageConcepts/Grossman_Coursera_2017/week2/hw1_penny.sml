(* Q1 *)
fun is_older(date1 : int*int*int, date2 : int*int*int)=
 #1 date1 < #1 date2 orelse (#1 date1 = #1 date2 andalso #2 date1 < #2 date2)
 orelse (#1 date1 = #1 date2 andalso #2 date1 = #2 date2 andalso #3 date1 < #3
 date2)

 (* Note you do not need parentheses - the "innermost" boolean expression is
 evaluated first. However their inclusion aids readability *)

(* Q2 *)

fun number_in_month(dateList : (int*int*int) list, month : int)=
if null dateList
then 0 (*This should be done with options, but will return an int (rather than
option) *)
else
if #2 (hd dateList) = month
then let val count = 0 in count + 1 + number_in_month(tl dateList,month) end
else
  number_in_month(tl dateList,month)

(* Q3 *)

fun number_in_months(dateList:(int*int*int) list, months : int list)=
if null months
then 0 (* Again come back to this with options. Null of dateList is taken careof
(although still needs options too) already in the function above *)
else
  number_in_month(dateList,hd months) + number_in_months(dateList,tl months)

(* Q4 *)
fun dates_in_month(dateList:(int*int*int) list, month : int)=
if null dateList
then [] (*This should be done with options, but will return an int (rather than
option) *)
else
if #2 (hd dateList) = month
then let val matchList = hd dateList::[] in hd matchList::dates_in_month(tl
dateList,month) end
else
  dates_in_month(tl dateList, month)

(* Q5 *)
fun dates_in_months(dateList:(int*int*int) list, monthList :int list)=
if null monthList
then [] (*Again, probably need to change this*)
else
  dates_in_month(dateList, hd monthList) @ dates_in_months(dateList, tl
  monthList) 

(* Q6 *)
fun get_nth(stringList : string list, n : int)=
if null stringList
then "string list is empty" (*Again, need to come back to this *)
else
  if n = 1
  then hd stringList
  else get_nth(tl stringList, n-1)

(* Q7 *)
fun date_to_string(date : int*int*int)=
let val monthStringList = ["January", "February", "March", "April", "May",
"June", "July", "August", "September", "October", "November", "December"]
in
  get_nth(monthStringList, #2 date) ^ " " ^ Int.toString(#3 date) ^ "," ^ " " ^
  Int.toString(#1 date)
end
(*Q8*)
fun number_before_reaching_sum(sum : int, xs : int list) =
if null xs
then 0 (*Again I need to use options here*)
else let val count = 1 in
if hd xs >= sum
then count-1
else
count + number_before_reaching_sum(sum- (hd xs), tl xs)
end

(*Q9*)

fun what_month (day_of_year : int) =
let val month_list = [31,28,31,30,31,30,31,31,30,31,30,31]
(*TODO I have populated with real days in a month 
(non-leap years). But I _think_ it might be fine with all
31's...come back for interest
*)
in
number_before_reaching_sum(day_of_year, month_list) + 1
end

(*Q10*)

fun month_range(day1 : int, day2 : int)=
if day1 > day2
then []
else if
day1 = day2
then
what_month(day1)::[]
else
what_month(day1)::month_range(day1 + 1, day2)

(*Q11*)
fun oldest(dates : (int*int*int) list)=
if null dates
then NONE
else if null (tl dates)
then SOME (hd dates)
else
  let fun older_date(date1: (int*int*int), date2: (int*int*int))=
  if is_older(date1, date2)
  then date1
  else date2
  in
    let val pairwise_compare_result = older_date(hd dates, hd(tl dates))
    in
      oldest(pairwise_compare_result::tl(tl dates))
    end
  end
  
(*Q12*)
(*A subproblem is to remove duplicates. A subproblem to that
* is to check if an int is in an int list *)

fun get_nth_for_intList(intList : int list, n : int)=
if null intList
then 0 
else
  if n = 1
  then hd intList
  else get_nth_for_intList(tl intList, n-1)

fun is_number_in_list(number : int, xs : int list)=
  if null xs
  then false (*Bad but something is up with my option foo*)
  else
    let val e = number = hd xs orelse is_number_in_list(number, tl xs)
    in
      e
    end


fun create_new_list(x : int)=
  x::[]


fun is_list_ordered(xs : int list)=
if null xs
then false
else if null (tl xs)
then true
else
  let val pairwise_comp = hd(tl xs)-(hd xs) >= 0
  in
    pairwise_comp andalso is_list_ordered(tl xs)
  end

fun order_list(xs : int list)=
  if null xs
  then []
  else if null (tl xs)
  then xs
  else if is_list_ordered(xs)
  then xs
  else 
    if hd xs > hd (tl xs)
    then [hd(tl xs)]@[hd xs]@order_list(tl(tl xs))
    else order_list([hd xs]@order_list(tl xs))

fun list_from_index_on(n : int, xs: int list)=
  if null xs
  then []
  else
    let val tl_call_count = 1
    in
      if tl_call_count = n
      then
        get_nth_for_intList(xs,n)::(tl xs)
      else list_from_index_on(n-1, tl (xs))
    end


fun count_duplicates(xs:int list)=
  (*assume ordered list, but we can add a check for that *)
if null xs orelse null (tl xs)
then 0
else
  let val count = 1
  in
    if hd(tl xs) = hd xs
    then count + count_duplicates(tl (tl xs))
    else count
  end

fun find_n (xs: int list, n :int)=
if null xs
then false
else
  hd xs = n orelse find_n(tl xs, n)

fun count_duplicates_of_n(xs : int list, n : int)=
if null xs
then 0
else if not(find_n(xs,n))
then 0
else 
  let val count = 1
  in
  if hd xs = n
  then    
      count + count_duplicates_of_n(tl xs, n)
     
  else
    count
  end

      
fun remove_duplicates(xs: int list)=
  (* assume int list ordered (and it will be when we make it local to
  * the final solution function *)
  if null xs
  then []
  else
    if is_number_in_list(hd xs, tl xs)
    then 
      let val hdDupes = count_duplicates_of_n(xs,hd xs)
      in
        [hd xs]@remove_duplicates(list_from_index_on(hdDupes+1, xs))
      end
    else
      [hd xs]@remove_duplicates(tl xs)
 
fun number_in_months_challenge(dates : (int*int*int)list, months : int list)=
let val ordered_months = order_list(months)
in
  let val unique_list = remove_duplicates(ordered_months)
  in
    number_in_months(dates, unique_list)
  end
end

fun dates_in_months_challenge(dates : (int*int*int)list, months : int list)=
let val ordered_months = order_list(months)
in
  let val unique_list = remove_duplicates(ordered_months)
  in
    dates_in_months(dates, unique_list)
	end
	end
