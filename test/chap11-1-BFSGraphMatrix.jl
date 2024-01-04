# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/BFSGraphList.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/graph.ts

@testset "chap 11: graph: breath-1st search" begin
	graph_matrix = [
		[0, 3, 1,  0, 0, 0, 0],
		[0, 0, 0,  0, 1, 0, 0],
		[0, 0, 7,  0, 0, 0, 0],
		[0, 0, 0,  0, 0, 0, 0],
		[0, 1, 0,  5, 0, 2, 0],
		[0, 0, 18, 0, 0, 0, 1],
		[0, 0, 0,  1, 0, 0, 1],
	]

	@test all(bfs(graph_matrix, 1, 7) .== [1, 2, 5, 6, 7,])
	@test isnothing(bfs(graph_matrix, 7, 1))
end
