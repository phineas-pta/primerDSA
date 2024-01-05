# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/DFSGraphList.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/graph.ts

@testset "chap 11: graph: depth-1st search" begin
	graph_list = [  # ATTENTION directed graph
		[GraphEdge(2, 3), GraphEdge(3, 1),],
		[GraphEdge(5, 1),],
		[GraphEdge(4, 7),],
		GraphEdge[],
		[GraphEdge(2, 1), GraphEdge(4, 5), GraphEdge(6, 2),],
		[GraphEdge(3, 18), GraphEdge(7, 1),],
		[GraphEdge(4, 1),]
	]

	@test all(dfs(graph_list, 1, 7) .== [1, 2, 5, 6, 7,])
	@test dfs(graph_list, 7, 1) |> isnothing
end
