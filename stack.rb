# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!
# A simple Node class.  A LinkList will be composed of many
# nodes.
class Node
  attr_accessor :next, :previous, :value

  def initialize(value)
    @value = value
  end


end


# A List class that should be implemented as
# a doubly linked list.  Also, it is important
# to keep track of a head and tail pointer
# for this lab.

# The following methods are the most important
# to implement and should be done first:

# new, push, pop, and length

# The following methods are nice to have and should
# be implemented next:

# [], []=, insert, shift, unshift, first, last

# The following methods are bonus and should only be tackled
# after the previous methods are implemented:

# reverse, max, min, reduce, each, flatten
class Stack
attr_reader :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
 def push(value)
    @node = Node.new(value)
    if @head == nil
      @head = @node
      @tail = @head
    else
      old_tail = @tail
      @tail = Node.new(value)
      old_tail.next = @tail
      @tail.previous = old_tail
    end
    @length += 1
    self
  end

  # Returns the value that is popped off
  # or nil if none exists
 def pop
    if @length == 0 
      return nil
    else
      old_tail = @tail
      if @tail.previous.nil?
        @head = nil
        @tail = nil
      else
        @tail = old_tail.previous
        @tail.next = nil
      end
      @length -= 1
    end
    old_tail.value
  end

  def insert(value)
  end

  # Given an index, returns the value at that index
  def [](index)
  end

  # Sets a value at the given index.  Returns the value that
  # was assigned
  def []=(index, value)
    value
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
  end

  # Adds a new value to the front of the list
  def unshift(value)
  end

  def first
  end

  def last
  end
end
