class Node
  attr_accessor :value, :next_node, :previous

  def initialize(value, next_node=nil, previous=nil)
    @value = value
    @next_node = next_node
    @previous = previous
  end

end