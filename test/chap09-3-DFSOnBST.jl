# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/DFSOnBST.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/tree.ts

@testset "chap 09: binary tree traversal: depth-1st search" begin
	@test dfs(my_binary_tree, 45)
	@test dfs(my_binary_tree, 7)
	@test !dfs(my_binary_tree, 69)
end
