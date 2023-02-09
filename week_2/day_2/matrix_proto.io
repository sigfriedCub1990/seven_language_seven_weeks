// Exercise #5
// TODO: Bonus! Write transpose method
Matrix := Object clone
Matrix matrix := list()

FILE_NAME := "matrix.txt"

Matrix dim := method(x, y,
   for(i, 1, y, self matrix append(list()))
   self matrix foreach(l, for(i, 1, x, l append(2)))
)

Matrix set := method(x, y, value,
    self matrix at(x) atPut(y, value)
)

Matrix get := method(x, y,
    self matrix at(x) at(y)
)

Matrix prettyPrint := method(
    self matrix foreach(row, 
       row foreach(column, "#{column} " interpolate print) 
       " " println
    )
)

Matrix saveToFile := method(
    f := if(File exists("matrix.txt"), 
        File clone openForUpdating("matrix.txt"),
        File clone open("matrix.txt")
    )

    self matrix foreach(row, 
       row foreach(column, f write("#{column} " interpolate)) 
       f write("\n")
    )

    f close
)

Matrix readFile := method(
    f := File clone openForReading(FILE_NAME)
    dimensions := f readLine split
    x := dimensions first asNumber
    y := dimensions second asNumber
    self dim(x, y)
    f foreachLine(ln, l, 
        l split foreach(i, val, self matrix at(ln) atPut(i, val))
    )
    f close
)

Matrix openFile := method(
   if(File exists("matrix.txt"),
    self readFile,
    self dim(4, 4)
   ) 
)

m := Matrix clone
m openFile

// "Value at (0, 1) is #{m get(0, 1)}" interpolate println

// m set(0, 1, 5)
// "Now value is #{m get(0, 1)}" interpolate println

"Pretty printing matrix" println
m prettyPrint

// m saveToFile
