function _search(curr::Union{NodeBT{T}, Nothing}, needle::T)::Bool where {T<:Number}
	if isnothing(curr)
		return false
	elseif curr.value == needle
		return true
	elseif curr.value < needle
		return _search(curr.right, needle)
	else
		return _search(curr.left, needle)
	end
end

"""
depth-1st search, must be binary search tree (not simply binary tree),
related concept: stack
"""
function dfs(root::NodeBT{T}, needle::T)::Bool where {T<:Number}
	return _search(root, needle)
end
