# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!
require './node.rb'

class Stack
  attr_reader :length
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

   def push(value)
    new_node = Node.new(value)
    @length += 1

    if @head.nil?
      @head = new_node
      @tail = @head
    else
      old_tail = @tail
      @tail = new_node
      old_tail.next_node = @tail
      @tail.previous = old_tail
    end
    @tail
  end

  def pop
    return nil if length == 0

    old_tail = @tail

    if @length == 1
      @head = nil
      @tail = nil
    else
      @tail = @tail.previous
    end

    @length -= 1
    old_tail.value
  end

  def [](index)
    return nil if index < 0 or index >= @length

    cur_node = @head

    index.times {|i| cur_node = cur_node.next_node }

    cur_node.value

  end

end
