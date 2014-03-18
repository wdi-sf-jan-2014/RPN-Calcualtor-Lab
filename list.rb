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
    new_node = Node.new(value)
    @length += 1

    # if new list (first node being added), head and tail are new_node
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

  def show
    node = @head
    while (node != nil)
      puts(node.value)
      node = node.next_node
    end
  end

  def show_rev
    node = @tail
    while (node != nil)
      puts(node.value)
      node = node.previous_node
    end
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
    node = @head
    retval = nil
    unless (node.nil?)
      retval = node.value
      @length -= 1
      @head = node.next_node
      if (@head.nil?)
        @tail = nil
      else
        @head.previous_node = nil
      end
      node.free
    end

    return retval
  end

  # Given an index, returns the value at that index
  def [](index)
    node = locate_node(index)
    node == nil ? retval = nil : retval = node.value
    return retval
  end

  def last
    retval = nil
    unless (@tail.nil?)
      retval = @tail.value
    end
    return retval
  end

  private

  def locate_node(index)
    if (index >= 0 && index < @length)
      node = @head
      index.times { node = node.next_node }
    else
      node = nil
    end

    return node
  end

end