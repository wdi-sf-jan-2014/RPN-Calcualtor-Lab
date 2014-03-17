# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!
require './node.rb'

class Stack
  attr_reader :length

  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  # Adds a new value to the end/top of the stack
  def push(value)
    new_node = Node.new(value)
    @length += 1

    # if new stack (first node being added), head and tail are new_node
    if @head == nil
      @head = new_node
      @tail = new_node
    else    
      @tail.next_node = new_node
      new_node.previous_node = @tail
      @tail = new_node
    end
  end

  # Returns the value that is popped off top of stack
  # or nil if none exists
  def pop
    if (@tail == nil)
      ret_val = nil
    else
      @length -= 1
      ret_val = @tail.value
      @tail = @tail.previous_node
      if (@tail.nil?)
        @head = nil
      end
      unless (@tail.nil?)
        @tail.next_node = nil
      end
    end

    return ret_val
  end

end
