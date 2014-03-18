# The stack should be implemented using a linked list.
# Do not use any ruby arrays!!
require './list.rb'

class Stack

  def initialize
    @list = List.new
  end

  def length
    @list.length
  end

  # Adds a new value to the end/top of the stack
  def push(value)
    @list.push(value)
  end

  # Returns the value that is popped off top of stack
  # or nil if none exists
  def pop
    @list.pop
  end

  def show
    puts('Top')
    @list.show_rev
    puts('Bottom')
  end

  def peak
    return @list.last
  end
end
