# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/DijkstraList.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/graph.ts

@testset "chap 11: dijkstra via adj list" begin

#= ATTENTION directed graph
   (2)─────(5)─────(6)
  / │       │      /│
(1) │ ─────-│-────- │
  \ │/      │       │
   (3)─────(4)─────(7)
=#
	graph_list = [  # ATTENTION directed graph
		[GraphEdge(2, 3), GraphEdge(3, 1),],
		[GraphEdge(1, 3), GraphEdge(3, 4), GraphEdge(5, 1),],
		[GraphEdge(2, 4), GraphEdge(4, 7), GraphEdge(1, 1),],
		[GraphEdge(3, 7), GraphEdge(5, 5), GraphEdge(7, 1),],
		[GraphEdge(2, 1), GraphEdge(4, 5), GraphEdge(6, 2),],
		[GraphEdge(7, 1), GraphEdge(5, 2), GraphEdge(3, 18),],
		[GraphEdge(4, 1), GraphEdge(6, 1),],
	]

	@test all(dijkstra_list(1, 7, graph_list) .== [1, 2, 5, 6, 7])
end
