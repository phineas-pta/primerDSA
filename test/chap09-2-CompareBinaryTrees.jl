# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/CompareBinaryTrees.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/tree.ts

@testset "chap 09: compare binary tree" begin
	tree2 = NodeBT(
		value=20,
		right=NodeBT(
			value=50,
			left=NodeBT(
				value=30,
				right=NodeBT(value=45, right=NodeBT(value=49)),
				left=NodeBT(value=29, left=NodeBT(value=21))
			)
		),
		left=NodeBT(
			value=10,
			right=NodeBT(value=15),
			left=NodeBT(value=5, right=NodeBT(value=7))
		)
	)
	@test my_binary_tree == my_binary_tree
	@test my_binary_tree != tree2
end
