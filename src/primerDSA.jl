module primerDSA

begin export  # workaround to line-break export statement
	linear_search, bs_list, two_crystal_balls,
	bubble_sort!,
	Queue, Stack, peekk, dequeue!, enqueue!, pushh!, popp!,
	Pointy, solve,
	quick_sort!
end

# include("chap01-bigO.jl")  # no unit test so not included

include("chap02-1-LinearSearchList.jl")  # linear_search
include("chap02-2-BinarySearchList.jl")  # bs_list
include("chap02-3-TwoCrystalBalls.jl")  # two_crystal_balls

include("chap03-1-BubbleSort.jl")  # bubble_sort!
include("chap03-2-Queue.jl")  # Queue, peekk, dequeue!, enqueue!
include("chap03-3-Stack.jl")  # Stack, peekk, pushh!, popp!

include("chap05-MazeSolver.jl")  # Pointy, solve

include("chap06-QuickSort.jl")  # quick_sort!

end  # module
