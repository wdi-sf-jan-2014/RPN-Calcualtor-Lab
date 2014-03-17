# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

class Stack

  require "./list"
  attr_reader :length

  def initialize
    @list = List.new
  end

  def length
    @length = @list.length
  end

  def push(value)
    @list.push(value)
  end

  def pop
    @list.pop
  end



end
