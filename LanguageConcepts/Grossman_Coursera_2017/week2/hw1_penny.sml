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

(* Q8 *) 
fun number_before_reaching_sum(sum : int, intList: int list)=
  if null intList 
  then 0
  else

(* Given the problem statement, we need an int list of size at least two
* (although we shall see in the comment immediately following that it will be
* actually three or more),(otherwise what does the "first n+1" elements mean?
*
* The assumption that the entire int list sums to more than sum value passed in
* implies that we need only concern ourselves with int list of SIZE THREE or
* more actually. Well actually, we should code for it, but simply that if list
* size is two exactly, the answer,n, is one. In fact this can make up a
* condition for an if statement*)

let fun get_nth_int(intList : intList, n : int)=
if n = 1
then (hd intList, n)
else
  get_nth_int(tl intList, n-1)
  
in
  let val n = 1
  in
  if tl(tl intList) = []
  then n (* The two element int list case *)
  else
    if get_nth_int(intList, n+1) + get_nth_int(intList, n) < sum andalso
    get_nth_int(intList, n+2) + get_nth_int(intList, n+1) + get_nth_int(intList,
    n) >= sum
    then n
    else
      

  

    





    
    

  


