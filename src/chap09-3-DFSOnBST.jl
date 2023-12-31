function search(curr::Union{NodeBT{T}, Nothing}, needle::T)::Bool where {T<:Number}
	if isnothing(curr)
		return false
	elseif curr.value == needle
		return true
	elseif curr.value < needle
		return search(curr.right, needle)
	else
		return search(curr.left, needle)
	end
end

function dfs(root::NodeBT{T}, needle::T)::Bool where {T<:Number}
	return search(root, needle)
end
