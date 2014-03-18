require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    arr = rpn_string.split(" ")
    rpn_stack = Stack.new
    arr.each { |x| rpn_stack.push(x) }
    return rpn_stack
  end

  def self.evaluate(rpn_list)
    # rpn list is a stack
  end

  def self.is_operation(operation)
    if ["+", "-", "^", "*", "/"].include?(operation)
      return true
    end
    return false
  end
  
  def self.is_number(num)
    if num.match(/[-]?\d+/)
      return true
    end
    return false
  end

end
