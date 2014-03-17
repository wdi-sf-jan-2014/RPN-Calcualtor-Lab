# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Node
  attr_accessor :next, :previous, :value
  def initialize(value)
    @value = value
  end
end

class Stack

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

    attr_accessor :push, :pop, :length

  def push(value)
      if @head == nil
        @head = Node.new(value)
        @tail = @head
      else
        old_tail = @tail
        @tail = Node.new(value)
        old_tail.next = @tail
        @tail.previous = old_tail
      end
      @length += 1
      nil
  end

  def pop
    return nil if @length == 0
 
    if @length == 1
      return_value = @tail.value
      nil_node(@tail)
      @tail = nil
      @head = nil
      @length = 0
      return return_value
    end

    old_tail = @tail
    @tail = old_tail.previous
    @tail.next = nil

    return_value = old_tail.value

    @length -= 1
 
    nil_node(old_tail)

    return_value
  end

  private
  def nil_node(node)
    node.value = nil
    node.previous = nil
    node.next = nil
  end

end