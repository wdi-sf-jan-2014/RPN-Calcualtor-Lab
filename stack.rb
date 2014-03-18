# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Stack

  def initialize
    @list = List.new
  end

  def length
    return @list.length
  end

  def push(value)
    @list.push value
    return @list
  end

  def pop
    return @list.pop
  end

end

class List
  attr_reader :length
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
  def push(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.previous = @tail
      @tail.next = node
      @tail = node
    end
    @length += 1
    return self
  end

  # Returns the value that is popped off
  # or nil if none exists
  def pop
    if @tail.nil?
      return nil
    elsif @tail == @head
      node = @tail
      @head = nil
      @tail = nil
      @length -= 1
      return node.value
    else
      @length -= 1
      node = @tail
      @tail = node.previous
      @tail.next = nil
      return node.value
    end
  end

  def insert(index, value)
    count = 0
    node = @head
    while count < index - 1
      node = node.next
      count += 1
    end
    @length += 1
    new_node = Node.new(value)
    new_node.next = node.next
    new_node.previous = node
    node.next = new_node
    return self
  end

  # Given an index, returns the value at that index
  def [](index)
    count = 0
    node = @head
    while count < index
      node = node.next
      count += 1
    end

    return nil if node.nil?
    return node.value
  end

  # Sets a value at the given index.  Returns the value that
  # was assigned
  def []=(index, value)
    count = 0
    node = @head
    while count < index
      node = node.next
      count += 1
    end

    return nil if node.nil?
    return node.value = value
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
    if @head == @tail && @length == 1
      node = @head
      @head = @tail = nil
      @length -= 1
      return node.value
    elsif @length > 1
      @length -= 1
      node = @head
      @head = node.next
      @head.previous = nil
      return node.value
    else
      return nil
    end
  end

  # Adds a new value to the front of the list
  def unshift(value)
    node = Node.new(value)
    if @head.nil?
      @head = @tail = node
    else
      old_head = @head
      @head = node
      @head.next = old_head
      old_head.previous = @head
    end
    @length += 1
    return self
  end

  def first
    return @head.value unless @head.nil?
  end

  def last
    return @tail.value unless @tail.nil?
  end

  def to_s

    if @length == 0
      return "[]"
    end

    node = @head
    count = 0
    list = "[ "
    while count < @length
      count += 1
      list += "#{node.value}, "
      node = node.next
    end
    list =  list[0..-3] + " ]"
    return list
  end

  def inspect
    self.to_s
  end

end

class Node
  attr_accessor :value, :previous, :next

  def initialize(value)
    @value = value
    @previous = nil
    @next = nil
  end

end
