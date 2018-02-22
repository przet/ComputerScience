(* While waiting for homework2 to come out (I had to re-enrol to a session which
* has not yet started), I am going to redo the first questions using the new
* things I have learnt in week3 *)

(*Q1*)
fun is_older((year,month,day),(year',month',day')) =
  year < year' orelse (year=year' andalso month<month')
  orelse (year=year' andalso month=month' andalso day<day')

  (* I am going to leave the above for now, but I would like to know
  * if its good for cases...atm I think NOT, but that could be because I
  * am not yet as comfortable with nested pattern matching as I could be??*)


(*Q2*)
fun number_in_month(dateList,inputMonth)=
  case dateList of
       [] => 0
     |(year,month,day)::xs' => if month = inputMonth
                               then let val count = 0 in
                                 count + 1 + number_in_month(xs',inputMonth)end
                               else
                                 number_in_month(xs',inputMonth)


(*Q3*)
fun number_in_months(dateList, months)=
case months of 
     [] =>0
   | month::months' =>
       number_in_month(dateList,month)+number_in_months(dateList,months')

(*Q3a*)
(*- my own exploration of something...how to check in one function if
* dateList and months are empty (in Q3 we rely on the fact that dateList is
* checked for empty in Q2 *)
fun number_in_months2(dateList,months)=
  case (dateList,months) of
       ([],_) => 0
     | (_,[]) => 0
     | (date::dateList',month::months') => number_in_month(dateList,month)+number_in_months(dateList,months')

(* Nice, this works too!)
