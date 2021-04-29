class LinkedList
  
	class Node
    attr_accessor :next, :data
    def initialize data
      self.data = data
      self.next = nil
    end
  end

	# O(1)
	def initialize
		self.head = nil
		self.tail = nil
		self.legth = 0
	end

	# O(1)
	def insert data
		node = Node.new data
		head.nil? ? self.head = node : self.tail.next = node
		self.tail = node
		self.length += 1        
	end

	# O(n)
	def remove node
		return nil unless node
		
		if node == head
			if head.next.nil?
				self.head = self.tail = nil
			else
				self.head = self.head.next
			end
		else
			tmp = self.head
			while tmp && tmp.next != node
				tmp = tmp.next
			end
			tmp.next = node.next if tmp
		end
		self.length -= 1
	end

	# O(1)
	def cat list
		return nil unless list
		
		self.tail.next = list.head
		self.legth += list.length
	end

	# O(n)
	def clear
		while self.length > 0
			remove self.head
		end        
	end

	def find &block
		return 
	end

end