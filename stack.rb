# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Node
  attr_accessor :next, :previous, :value
  
  def initialize(value)
    @value = value
  end
end

class Stack

  attr_reader :length
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
  def push(value)
    newNode = Node.new(value)
    if @head.nil?
      @head = newNode
      @tail = @head
    else 
      old_tail = @tail
      @tail = newNode
      @tail.previous = old_tail
    end
    @length += 1
    nil
  end

  # Returns the value that is popped off
  # or nil if none exists
  def pop
    # return nil if @length == 0
    # Tim did a fancy private method.....
    if @tail.nil?
      old_tail = nil
    else
      old_tail = @tail.value
      if @tail.previous.nil?
        @tail = nil
      else
        new_tail = @tail.previous
        @tail = new_tail
      end
      @length -= 1
    end
    # @tail.previous = new_tail.previous  
    return old_tail

  end
end