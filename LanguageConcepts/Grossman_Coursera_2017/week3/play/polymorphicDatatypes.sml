datatype 'a option = NONE | SOME of 'a (* This is _exactly_ how options are
defined in ml *)

datatype ('a,'b) tree = 
 Node of 'a * ('a,'b) tree * ('a,'b) tree
 | Leaf of 'b
