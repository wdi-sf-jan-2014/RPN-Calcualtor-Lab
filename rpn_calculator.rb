require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    rpn_string.split(" ")
  end

  def self.evaluate(rpn_list)
    new_stack = Stack.new
    rpn_list.each do |x|
      if self.is_number(x)
        new_stack.push(x)
      elsif self.is_operation(x)
        operator = x
        value = new_stack.pop
        value2 = new_stack.pop
        return_value = value2.to_f.public_send(operator, value.to_f)
        new_stack.push(return_value)
      end
    end
    return new_stack.pop
  end

  def self.is_operation(operation)
   operation.match(/[\*+-\/\^]/) == nil ? false: true
  end
  
  def self.is_number(num)
   num.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) == nil ? false : true
  end
end
