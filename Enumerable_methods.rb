
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
		result = []
		until counter == self.length
			result << self[counter] if yield self[counter]
			counter += 1
		end
		return result
	end

	def my_all?
		counter = 0
		result = []
		block = Proc.new {|val| val}
		until counter == self.length
			if block_given?
				result.push(yield self[counter])
			else
				result.push(block.call(self[counter]))
			end
			counter += 1
		end
		if result.include?(false) || result.include?(nil)
			puts false
		else
			puts true
		end
	end

	def my_any?
		counter = 0
		result = []
		block = Proc.new {|val| val}
		until counter == self.length
			if block_given?
				result.push(yield self[counter])
			else
				if block.call(self[counter]) == false || block.call(self[counter]) == nil
					result.push(false)
				else
					result.push(true)
				end
			end
			counter += 1
		end
		if result.include?(true)
			puts true
		else
			puts false
		end			
	end

end