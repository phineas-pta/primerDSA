struct Pointy  # coordinates are array index
	x::Unsigned
	y::Unsigned
end

const _pointy_dir = [ # direction can go
	(-1, 0),  # left
	(1, 0),   # right
	(0, -1),  # down
	(0, 1),   # up
]

function _walk!(maze::Vector{String}, wall::Char, curr::Pointy, endd::Pointy, seen::Vector{Vector{Bool}}, path::Vector{Pointy})::Bool

	# 1. base case ==================================================
	if curr.x < 1 || curr.x > length(maze[1]) || curr.y < 1 || curr.y > length(maze)
		return false # 1.1. off the map
	end
	if maze[curr.y][curr.x] == wall # 1.2. on the wall
		return false
	end
	if #= curr.x == endd.x && curr.y == endd.y =# curr === endd # 1.3. at the end
		push!(path, endd)
		return true
	end
	if seen[curr.y][curr.x] # 1.4. already seen it
		return false
	end

	# 2. recursive case =============================================
	seen[curr.y][curr.x] = true
	push!(path, curr) # 2.1. pre
	for i ∈ _pointy_dir # 2.2. recurse
		next = Pointy(curr.x + i[1], curr.y + i[2])
		if _walk!(maze, wall, next, endd, seen, path) return true end
	end
	pop!(path) # 2.3. post
	return false

end

function solve(maze::Vector{String}, wall::Char, start::Pointy, endd::Pointy)::Vector{Pointy}
	path = Pointy[]
	seen = [fill(false, length(i)) for i ∈ maze]
	_walk!(maze, wall, start, endd, seen, path)
	return path
end
