(*not that variable name "rec" seems to be reserved...you will get a compile
* time error*)
val rx = {fileName = "myfile", fileType = ".type1", fileSize = 10456857,
fileSizeUnits = "Kb" }

val justATuple = {1="hello",2=3, 3="there"}

val alsoATuple = {1 ="hello", 3="there", 2=3}

val notATuple = {1 ="hello", 4="there", 2=3}
