require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    arg_list = List.new
    rpn_string.split(' ').each {|arg| arg_list.push(arg)}
    return arg_list
  end

  def self.evaluate(rpn_list)
  end

  def self.is_operation(operation)
  end
  
  def self.is_number(num)
  end
end
