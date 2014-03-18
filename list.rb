# A List class that should be implemented as
# a doubly linked list.  Also, it is important
# to keep track of a head and tail pointer
# for this lab.

# The following methods are the most important
# to implement and should be done first:

# new, push, pop, and length

# The following methods are nice to have and should
# be implemented next:

# [], []=, insert, delete_at, shift, unshift, first, last

# The following methods are bonus and should only be tackled
# after the previous methods are implemented:

# reverse, max, min, reduce, each, flatten

require './node.rb'

class List
  attr_reader :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
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

  # Returns the value that is popped off
  # or nil if none exists
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

  # Sets a value at the given index.  Returns the value that
  # was assigned.  Returns nil if index was out of bounds.
  # Returns self otherwise.
  def []=(index, value)
    return nil if index < 0 or index >= @length

    cur_node = @head

    index.times {|i| cur_node = cur_node.next }

    cur_node.value = value

    self
  end

  def insert(index, value)
    index = 0 if index < 0
    index = @length if index > @length

    if @head == nil
      @head = Node.new(value)
      @tail = @head
      @length += 1
    elsif index == @length
      push(value)
    elsif index == 0
      unshift(value)
    else
      cur_node = @head

      index.times { |i| cur_node = cur_node.next }

      new_node = Node.new(value)
      new_node.next = cur_node
      new_node.previous = cur_node.previous

      cur_node.previous.next = new_node
      cur_node.previous = new_node
      @length += 1
    end

    nil
  end

  def delete_at(index)
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
    # special case where the length of the list is 1
    # so the head and tail need to be set to nil
    if @length == 1
      return_value = @head.value
      nil_node(@head)
      @tail = nil
      @head = nil
      @length = 0
      return return_value
    end

    old_head = @head
    @head = old_head.next
    @head.previous = nil

    return_value = old_head.value

    @length -= 1

    # Making sure the old_head has no references to nodes or
    # values.
    nil_node(old_head)

    return_value
  end

  # Adds a new value to the front of the list
  def unshift(value)
    if @head == nil
      @head = Node.new(value)
      @tail = @head
    else
      old_head = @head
      @head = Node.new(value)
      old_head.previous = @head
      @head.next = old_head
    end
    @length += 1
    nil
  end

  def first
    return @head.value if @head
    return nil
  end

  def last
    return @tail.value if @tail
    return nil
  end

private
  def nil_node(node)
    node.value = nil
    node.previous = nil
    node.next = nil
  end
end
