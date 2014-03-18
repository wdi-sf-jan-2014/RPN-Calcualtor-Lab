# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

require './node.rb'

class Stack

  attr_reader :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

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

    # special case where the length of the list is 1
    # so the head and tail need to be set to nil
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

    # Making sure the old_tail has no references to nodes or
    # values.
    nil_node(old_tail)

    return_value
  end

  # Given an index, returns the value at that index
  def [](index)
    return nil if index < 0 or index >= @length

    cur_node = @head

    index.times {|i| cur_node = cur_node.next }

    cur_node.value

  end

private
  def nil_node(node)
    node.value = nil
    node.previous = nil
    node.next = nil
  end

end
