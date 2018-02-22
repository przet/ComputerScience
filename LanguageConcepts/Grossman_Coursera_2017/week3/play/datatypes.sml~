(* To make one-of types *)

datatype myFirstType = Pizza 
                     | TwoInts of int*int 
                     | Str of string
                    

fun f (x: myFirstType) = 
  case x of 
       Pizza => 3
     |TwoInts(i1,i2) => i1 + i2
     |Str s => String.size s
     
fun f2 x = (* Equivalent to f: compiler will infer from the body that x must be
  of type 'myFirstType'*)
  case x of
       Pizza =>3
     |TwoInts(i1,i2) => i1 + i2
     |Str s => String.size s
    
