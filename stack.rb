# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Stack
  attr_reader :length
  attr_accessor :tail

  def initialize
    @tail = nil
    @length = 0
  end

  def push(value)
    node = Node.new(value)
    if @tail.nil?
      @tail = node
    else
      node.previous = @tail
      @tail = node
    end
    @length += 1
    return self
  end

  def pop
    if @tail.nil?
      return nil
    else
      node = @tail
      @tail = node.previous
      @length -= 1
      return node.value
    end
  end

end

class Node
  attr_accessor :value, :previous

  def initialize(value)
    @value = value
    @previous = nil
  end

end
