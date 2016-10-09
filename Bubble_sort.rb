def bubble_sort(input)
	count = 0
	while count < input.length - 1
		if input[count] > input[count + 1]
			input[count], input[count + 1] = input[count + 1], input[count]
			count = 0
		end
		count += 1
	end
end
bubble_sort([1,6,2,5,4,6,8])