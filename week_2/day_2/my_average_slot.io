// Exercise #4
List myAverage := method(
    if(self size == 0, 
        "List should have length greater than 0",
        self sum / self size
    )
)

l := list(1,2,3,5,7)
l myAverage println
list() myAverage
