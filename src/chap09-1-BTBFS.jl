"""breath-1st search"""
function bfs(root::NodeBT{T}, needle::T)::Bool where {T<:Number}
	q::Vector{Union{NodeBT{T}, Nothing}} = [root]  # force typing to prevent error with push!
	while length(q) > 0
		curr = popfirst!(q)
		if isnothing(curr) continue end
		if curr.value == needle return true end
		push!(q, curr.left)
		push!(q, curr.right)
	end
	return false
end
