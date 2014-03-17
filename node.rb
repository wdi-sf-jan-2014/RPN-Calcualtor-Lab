class Node

  attr_accessor :value, :next, :previous
  def initialize(value)
    @value = value
    @previous = nil
    @next = nil
  end

end
