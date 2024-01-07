"""
breath-1st search: visit 1 level at a time,
related concept: queue
"""
function bfs(root::NodeBT{T}, needle::T)::Bool where {T<:Number}
	q::Vector{Union{NodeBT{T}, Nothing}} = [root]  # force typing to prevent error with push!
	# q to behave like a queue
	while length(q) > 0
		curr = popfirst!(q)  # deque
		if isnothing(curr) continue end
		if curr.value == needle return true end
		if !isnothing(curr.left)  push!(q, curr.left)  end
		if !isnothing(curr.right) push!(q, curr.right) end
	end
	return false
end
