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
	#= chap 10 =# MinHeap
end

# @kwdef to define default values in struct

@kwdef mutable struct NodeLL{T<:Number}  # used in linked list struct (stack, queue, doubly)
	const value::T
	prev::Union{NodeLL{T}, Nothing} = nothing
	next::Union{NodeLL{T}, Nothing} = nothing
end

@kwdef mutable struct NodeBT{T<:Number}  # binary tree itself
	const value::T
	right::Union{NodeBT{T}, Nothing} = nothing
	left::Union{NodeBT{T}, Nothing} = nothing
end

"""for debugging"""
function get_node_value(node::Union{NodeLL{T}, NodeBT{T}, Nothing})::Union{T, Nothing} where {T<:Number}
	return isnothing(node) ? nothing : node.value
end

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

end  # module
