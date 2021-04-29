class LinkedList
	class Node
		attr_accessor :next, :data
		
		def initialize data
      self.data = data
      self.next = nil
    end
  end
	
	attr_accessor :head, :tail, :length
	
	# O(1)
	def initialize
		self.head = nil
		self.tail = nil
		self.length = 0
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
		self.length += list.length
	end
	
	# O(n)
	def clear
		while self.length > 0
			remove self.head
		end        
	end
	
	# O(n)
	def find_first &predicate
		return nil unless block_given?
		
		current = self.head
		while current
			return current if predicate.call(current)
			current = current.next
		end
	end
	
	# O(n)
	def each
		return nil unless block_given?
		
		current = self.head
		while current
			yield current
			current = current.next
		end
	end
	
	# O(n)
	def print
		if self.length == 0
			puts 'empty' 
		else
			self.each { |item| puts item.data }
		end
	end
	
	# O(n)
	def find_by_data data
		self.find_first { |item| item.data == data }
	end
end


# Testing:
list = LinkedList.new
list.insert 'whaaaaat'
list.insert 'será que duncionou?'
list.print
list.remove list.find_by_data 'whaaaaat'
list.print

list2 = LinkedList.new
list2.insert 1234
list2.print

list.cat list2
list.print

