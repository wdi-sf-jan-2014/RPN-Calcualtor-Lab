# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!

require './list.rb'

class Stack
  def initialize
    @list = List.new
  end

  def push(value)
    @list.push(value)
  end

  def pop
    @list.pop
  end

  def length
    @list.length
  end
end
