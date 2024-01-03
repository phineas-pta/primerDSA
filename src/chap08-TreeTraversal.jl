# visit all nodes of a binary tree

function _walk!(curr::Union{NodeBT{T}, Nothing}, path::Vector{T}; search_order::String) where {T<:Number}
	if isnothing(curr) return nothing end
	if search_order == "pre" push!(path, curr.value) end
	_walk!(curr.left, path; search_order=search_order)
	if search_order == "in" push!(path, curr.value) end
	_walk!(curr.right, path; search_order=search_order)
	if search_order == "post" push!(path, curr.value) end
	return nothing
end

# combine 3 original functions: `pre_order_search`, `in_order_search`, `post_order_search`
function traverse_tree(root::NodeBT{T}; search_order::String)::Vector{T} where {T<:Number}
	if search_order ∉ ["pre", "in", "post"] error("oh no") end
	path = T[]
	_walk!(root, path; search_order=search_order)
	return path
end
