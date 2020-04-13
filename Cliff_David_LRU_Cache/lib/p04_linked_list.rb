class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def inspect
    self.to_s
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    if self.empty?               #head
      node = Node.new(key, val) #first
      @head.next = node          #tail
      @tail.prev = node
      node.prev = @head
      node.next = @tail
    else
      node = Node.new(key, val) #head   
      @tail.prev.next = node    #first   
      @tail.prev = node          #second  
    end                          #third  
  end                           #tail  

  def update(key, val)
    
  end

  def remove(key)
  end

  
#head  
#first 
#second
#third 
#tail  

# arr.my_each do |ele|

# end

# def my_each
#   i = 0

#   while i < self.length
#     self[i]
#     i += 1
#   end
#   self
# end

  # def each
  #   node = self.first
  #   until node == @tail 
  #     node
  #     node = node.next
  #   end
  #   self
  # end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
