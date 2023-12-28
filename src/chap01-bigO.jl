"""
time complexity: big 𝒪 notation
𝒪(1) ― 𝒪(㏒n) ― 𝒪(n) ― 𝒪(n ㏒n) ― 𝒪(n²) ― 𝒪(2ⁿ) ― 𝒪(n!)

no unit test so not included in main program
"""


"""𝒪(n) as number of operations increases linearly with the size of the input"""
function sum_char_codes_1(str::String)::Integer
	res = 0
	for i ∈ str
		res += Int(i)
	end
	return res
end

"""still 𝒪(n) as linear increasing"""
function sum_char_codes_2(str::String)::Integer
	res = 0
	for i ∈ str
		res += Int(i)
	end
	for i ∈ str
		res += Int(i)
	end
	return res
end

"""still 𝒪(n) as consider the worst case, despite function could end earlier"""
function sum_char_codes_3(str::String)::Integer
	res = 0
	for i ∈ str
		tmp = Int(i)
		if tmp == 69 return res end
		res += tmp
	end
	return res
end

"""𝒪(n²) as nested loop"""
function sum_char_codes_4(str::String)::Integer
	res = 0
	for i ∈ str, j ∈ str
		res += Int(j)
	end
	return res
end

"""𝒪(n³)"""
function sum_char_codes_4(str::String)::Integer
	res = 0
	for i ∈ str, j ∈ str, k ∈ str
		res += Int(k)
	end
	return res
end
