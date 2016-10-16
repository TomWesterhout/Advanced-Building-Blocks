
module Enumerable

	def my_each
		if block_given?
			0.upto(self.length - 1) do |i|
				yield self[i]
			end
		end
		return self
	end

	def my_each_with_index
		if block_given?
			0.upto(self.length - 1) do |i|
				yield self[i], i
			end
		end
		return self
	end

	def my_select
		return self unless block_given?
		result = []
		my_each { |val| result << val if yield val }
		return result
	end

	def my_all?
		if block_given?
			my_each { |val| return false unless yield val }
		else
			my_each { |val| return false if val.nil? || val == false}
		end
		return true
	end

	def my_any?
		if block_given?
			my_each { |val| return true if yield val }
			return false
		else
			my_each { |val| return false if val.nil? || val == false }
			return true
		end
	end

	def my_none?
		if block_given?
			my_each { |val| return false if yield val }
			return true
		else
			my_each { |val| return false if val }
			return true
		end
	end

	def my_count(arg=nil)
		result = 0
		if !arg.nil?
			my_each { |val| result += 1 if val == arg }
		else
			my_each { |val| result += 1 if yield val }
		end
		return result
	end

	def my_map(&proc)
		return self unless block_given?
		result = []
		my_each { |val| result.push(yield val) }
		return result
	end

	def my_inject(arg=nil)
		result = 0
		if arg.nil?
			if block_given?
				my_each { |val| result = yield(result, val) }
			else
				return "Block is missing."
			end
		else
			my_each { |val| result = result.send(arg, val) }
		end
		return result
	end

	def my_map(&proc)
		result = []
		if block_given?
			if proc?
				my_each { |val| result.push(proc.call(val)) }
			else
				my_each { |val| result.push(yield val) }
			end
		else
			if proc?
				my_each { |val| result.push(proc.call(val)) }
			else
				return self
			end
		end
		return result
	end

	def multiply_els
		my_inject do |sum, val|
			if sum == 0
				sum = val
			else
				sum * val
			end
		end
	end

end