# A simple Node class.  A LinkList will be composed of many
# nodes.
class Node
  attr_accessor :value, :next_node, :previous_node

  def initialize(value)
    @value = value
    @next_node = nil
    @previous_node = nil
  end

  def free
    self.value = nil
    self.next_node = nil
    self.previous_node = nil
  end
end
