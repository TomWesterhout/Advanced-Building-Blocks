def bubble_sort_by(input, &compare)
	counter = 0
	while counter < input.length - 1
		if compare.call(input[counter], input[counter + 1]) == 1
			input[counter], input[counter + 1] = input[counter + 1], input[counter]
			counter = 0
		else
			counter += 1
		end
	end
	puts input
end
compare = Proc.new {|a, b| a.length <=> b.length}
input = gets.chomp.split(" ")
bubble_sort_by(input, &compare)