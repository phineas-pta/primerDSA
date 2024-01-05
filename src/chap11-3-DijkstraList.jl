# for better optimization: use min heap
function _hasUnvisited(seen::Vector{Bool}, dists::Vector{<:Real})::Bool
	for (idx, val) ∈ enumerate(seen)
		if !val && dists[idx] < Inf return true end
	end
	return false
end

function _getLowestUnvisited(seen::Vector{Bool}, dists::Vector{<:Real})::Integer
	idx = -1
	lowestDistance = Inf
	for i ∈ eachindex(seen)
		if seen[i] continue end
		if lowestDistance > dists[i]
			lowestDistance = dists[i]
			idx = i
		end
	end
	return idx
end

function dijkstra_list(source::Integer, sink::Integer, arr::Vector{Vector{GraphEdge}})::Vector{Integer}
	seen = fill(false, length(arr))  # nodes already checked
	prev = fill(-1, length(arr))  # nodes departed from
	dists = fill(Inf, length(arr))  # Inf is a float
	dists[source] = 0

	while _hasUnvisited(seen, dists)
		curr = _getLowestUnvisited(seen, dists)
		seen[curr] = true

		adjs = arr[curr]
		for edge ∈ adjs
			if seen[edge.to] continue end
			dist = dists[curr] + edge.weight
			if dist < dists[edge.to]
				dists[edge.to] = dist
				prev[edge.to] = curr
			end
		end
	end

	out = Integer[]
	curr = sink
	while prev[curr] ≠ -1
		pushfirst!(out, curr)
		curr = prev[curr]
	end
	pushfirst!(out, source)
	return out
end
