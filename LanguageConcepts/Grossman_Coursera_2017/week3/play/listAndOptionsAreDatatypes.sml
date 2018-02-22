datatype my_int_list = Empty
                     | Cons of int * my_int_list

fun append_my_list (xs, ys) =
  case xs of
       Empty => ys
     | Cons(x,xs') => Cons(x, append_my_list(xs',ys))

fun sum_list xs =
  case xs of
       [] => 0
     |x::xs' => x + sum_list xs'

     (* :: is a constructor that carries two things; that's all it is. It is
     * applied as an infix operator, rather than prefix *)

(* I am not quite sure if I agree with Dan's example above, given how in week2
* we made efforts to return NONE to the empty list. And I don't think the sum of 
       * an empty list is zero, as I think it may not make sense...but then
         * again it could make sense, depending on how you look at it.
         * Here is another version....*)
fun sum_list2 xs =
  case xs of
       [] => NONE
     | x::xs' => SOME(x + sum_list xs')

(* If you pass [1,2,3] to either of sum_list or sum_list2, it appears the
* pattern 1::[2,3] is matched.*)

fun append(xs,ys)=
  case xs of 
       [] => ys
     | x::xs' => x :: append(xs',ys)

     (*Interesting, yes x::xs' means xs is _at least_ a one element list *)
     

(* What about options... *)
fun inc_or_zero intoption =
  case intoption of
       NONE => 0
     | SOME i => i + 1

(* And even though sometimes hd, tl are useful, we don't need them: *)
fun hd_list xs =
  case xs of
       [] => NONE
     | x::xs' => SOME x

(* so we have the head, but an an option - how to extract? Well Dan says use
* pattern matching NOT valOf....How do we do this? *)

(*Note handling the empty case for hd of list does't seem imediately
* obvious...and in fact, in the REPL hd [] creates an uncaught exception Empty
* compile time error*)

(* But what if we modify inc_or_zero intoption to the following...*)
fun inc_or_zero intoption2 =
  case intoption of
       NONE => 0
     |SOME i => i

(* Then we could write:*)
(* hmmmm not sure how I could write it...*)
