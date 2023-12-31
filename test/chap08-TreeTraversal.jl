# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/BTPreOrder.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/tree.ts

@testset "chap 08: traverse binary tree" begin
	@test all(traverse_tree(binary_tree; search_order="pre")  .== [20, 10, 5, 7, 15, 50, 30, 29, 45, 100])
	@test all(traverse_tree(binary_tree; search_order="in")   .== [5, 7, 10, 15, 20, 29, 30, 45, 50, 100])
	@test all(traverse_tree(binary_tree; search_order="post") .== [7, 5, 15, 10, 29, 45, 30, 100, 50, 20])
end
