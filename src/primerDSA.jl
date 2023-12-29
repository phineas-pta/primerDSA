module primerDSA

# no need export functions in Base but multiple-dispatched
begin export  # workaround to line-break export statement
	#= chap 02 =# linear_search, bs_list, two_crystal_balls,
	#= chap 03 =# bubble_sort!, Queue, Stack, dequeue!, enqueue!,
	#= chap 05 =# Pointy, solve,
	#= chap 06 =# quick_sort!,
	#= chap 07 =# DoublyLinkedList, remove!, removeAt!
end

# @kwdef to define default values in struct
@kwdef mutable struct Node{T<:Number}  # used in linked list struct (stack, queue, doubly)
	const value::T
	prev::Union{Node{T}, Nothing} = nothing
	next::Union{Node{T}, Nothing} = nothing
end

function get_node_value(node::Union{Node{T}, Nothing})::Union{T, Nothing} where {T<:Number}
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

end  # module
