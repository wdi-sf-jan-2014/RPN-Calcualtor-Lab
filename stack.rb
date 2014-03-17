# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Stack

  require "./node"
  attr_reader :length

  def initialize
    @tail = nil
    @length = 0
  end

  def push(value)

    if @length == 0
      @tail = Node.new(value)
    else
      node = Node.new(value)
      node.previous = @tail
      @tail = node
    end
    @length+=1

  end

  def pop
    if @length == 0
      return nil
    elsif @head == @tail
      temp = @head
      @head = nil
      @tail = nil
      @length = 0
      return temp.value
    else
      temp = @tail
      @tail = @tail.previous
      @tail.next = nil
      temp.previous = nil
      @length = @length - 1
      return temp.value
    end
  end



end
