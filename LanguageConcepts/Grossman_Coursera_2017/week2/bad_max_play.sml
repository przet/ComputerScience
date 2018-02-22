(* I want to understand the bad_max example (p.g 2 of slides under "Let
* expressions to avoid repeated computation) *)


fun bad_max( xs : int list)=
  if null xs
  then ~1 
  else
    if null (tl xs)
    then 0 
    else 
      if hd xs > bad_max(tl xs)
      then 1
      else bad_max(tl xs)
      
