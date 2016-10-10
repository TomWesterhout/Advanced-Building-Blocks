
module Enumerable

	def self.my_each
		count = 0
		until count == self.length
			yield self[count]
			count += 1
		end
		return self
	end
	
end