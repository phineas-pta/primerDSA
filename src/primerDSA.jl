module primerDSA

# no need export functions in Base but multiple-dispatched
begin export  # workaround to line-break export statement
	#= chap 02 =# linear_search, bs_list, two_crystal_balls,
	#= chap 03 =# bubble_sort!, Queue, Stack, dequeue!, enqueue!,
	#= chap 05 =# Pointy, solve,
	#= chap 06 =# quick_sort!,
	#= chap 07 =# DoublyLinkedList, remove!, removeAt!,
	#= chap 08 =# NodeBT, traverse_tree,
	#= chap 09 =# bfs, dfs,
	#= chap 10 =# MinHeap,
	#= chap 11 =# GraphEdge, #= bfs, dfs, =# dijkstra_list,
	#= chap 12 =# LRU, update!
end

include("global.jl")

# include("chap01-bigO.jl")  # no unit test so not included

include("chap02-1-LinearSearchList.jl")
include("chap02-2-BinarySearchList.jl")
include("chap02-3-TwoCrystalBalls.jl")

include("chap03-1-BubbleSort.jl")
include("chap03-2-Queue.jl")
include("chap03-3-Stack.jl")

include("chap05-MazeSolver.jl")

include("chap06-QuickSort.jl")

include("chap07-DoublyLinkedList.jl")

include("chap08-TreeTraversal.jl")

include("chap09-1-BTBFS.jl")
include("chap09-2-CompareBinaryTrees.jl")
include("chap09-3-DFSOnBST.jl")

include("chap10-MinHeap.jl")

include("chap11-1-BFSGraphMatrix.jl")
include("chap11-2-DFSGraphList.jl")
include("chap11-3-DijkstraList.jl")

include("chap12-LRU.jl")

end  # module
