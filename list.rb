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
class List

  require "./node"
  attr_reader :length
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
  def push(value)

    if @length == 0
      @head = Node.new(value)
      @tail = @head
    else
      old_tail = @tail
      @tail = Node.new(value)
      old_tail.next = @tail
      @tail.previous = old_tail
    end
    @length+=1

  end

  # Returns the value that is popped off
  # or nil if none exists
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

  # Given an index, returns the value at that index
  def [](index)
    count = 0
    node = @head

    while (count < index)
      node = node.next
      count += 1
    end
    if node == nil
      return nil
    else
      return node.value
    end

  end

  # Sets a value at the given index.  Returns the value that
  # was assigned
  def []=(index, value)
    count = 0
    node = @head
    while (count < index)
      node = node.next
      count += 1
    end
    if node == nil
      return nil
    else
      node.value = value
      return node.value
    end
  end

  def first
    if @head
      return @head.value
    else
      return nil
    end
  end

  def last
    if @tail
      return @tail.value
    else
      return nil
    end
  end

end
