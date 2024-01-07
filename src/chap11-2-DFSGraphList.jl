# WeightedAdjacencyList = Vector{Vector{GraphEdge}}
# not matrix coz not regular

function _walk!(graph::Vector{Vector{GraphEdge}}, curr::Integer, needle::Integer, seen::Vector{Bool}, path::Vector{Integer})::Bool
	if seen[curr] return false end
	seen[curr] = true

	push!(path, curr)
	if curr == needle return true end

	for edge ∈ graph[curr]
		if _walk!(graph, edge.to, needle, seen, path) return true end
	end

	pop!(path)
	return false
end

"""
depth-1st search

### Input
- source: starting node
- needle: ending node

### Output
- path taken
"""  # Unsigned cause some type mismatch
function dfs(graph::Vector{Vector{GraphEdge}}, source::Integer, needle::Integer)::Union{Vector{Integer}, Nothing}
	seen = fill(false, length(graph))  # nodes already checked
	path = Integer[]
	_walk!(graph, source, needle, seen, path)
	return length(path) > 0 ? path : nothing
end
