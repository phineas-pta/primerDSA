using Test
using primerDSA

const array_to_search = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420]
const array_to_sort = [9, 3, 7, 4, 69, 420, 42]
const my_binary_tree = NodeBT(
	value=20,
	right=NodeBT(
		value=50,
		right=NodeBT(value=100),
		left=NodeBT(value=30, right=NodeBT(value=45), left=NodeBT(value=29))
	),
	left=NodeBT(
		value=10,
		right=NodeBT(value=15),
		left=NodeBT(value=5, right=NodeBT(value=7))
	)
)

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
