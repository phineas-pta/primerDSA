# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/BTBFS.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/tree.ts

@testset "chap 09: binary tree traversal: breath-1st search" begin
	@test bfs(my_binary_tree, 45)
	@test bfs(my_binary_tree, 7)
	@test !bfs(my_binary_tree, 69)
end
