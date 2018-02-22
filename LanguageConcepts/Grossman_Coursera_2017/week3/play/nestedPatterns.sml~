exception ListLengthMisMatch
fun zip lists=
  case lists of
       ([],[],[]) => []
     |(x::xs',y::ys',z::zs') => (x,y,z)::zip(xs',ys',zs')
     | _ => raise ListLengthMisMatch
