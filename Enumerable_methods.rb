
module Enumerable

	def my_each
		counter = 0
		until counter == self.length
			yield self[count]
			count += 1
		end
		return self
	end

	def my_each_with_index
		counter = 0
		until counter == self.length
			yield(self[counter], counter)
			counter += 1
		end
		return self
	end

	def my_select
		counter = 0
		result = Array.new
		until counter == self.length
			result << self[counter] if yield self[counter]
			counter += 1
		end
		return result
	end
	
end