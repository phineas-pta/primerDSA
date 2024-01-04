# WeightedAdjacencyMatrix = Vector{Vector{<:Integer}}
# use Vector{Vector{<:Integer}} instead of Matrix{<:Integer}
# because the function operate on rows, meanwhile julia matrix is column-major in memory

"""
breath-1st search

### Input
- source: starting node
- needle: ending node

### Output
- path taken
"""  # Unsigned cause some type mismatch
function bfs(graph::Vector{Vector{T}}, source::T, needle::T)::Union{Vector{T}, Nothing} where {T<:Integer}
	seen = fill(false, length(graph))  # nodes already checked
	prev = fill(-1, length(graph))  # nodes departed from
	seen[source] = true
	q = [source]  # to behave like a queue

	while length(q) > 0
		curr = popfirst!(q)  # dequeue
		if curr == needle break end
		adjs = graph[curr]
		for i ∈ eachindex(adjs)
			if adjs[i] == 0 || seen[i] continue end
			seen[i] = true
			prev[i] = curr
			push!(q, i)

		end
	end

	if prev[needle] == -1 return nothing end
	# build path by going backward
	curr = needle
	out = Integer[]
	while prev[curr] != -1
		pushfirst!(out, curr)
		curr = prev[curr]
	end
	pushfirst!(out, source)
	return out
end
