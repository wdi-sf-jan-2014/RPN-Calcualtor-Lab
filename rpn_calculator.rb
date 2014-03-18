require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    rpn_string.split(" ")
  end

  def self.evaluate(rpn_list)
    stack = Stack.new()
    rpn_list.each do |f|
      if self.is_operation(f)
        stack.push(f)
        operator = stack.pop
        value2 = (stack.pop).to_f
        value1 = (stack.pop).to_f
        return_value = value1.public_send(operator,value2)
        stack.push(return_value)
        return return_value
      else
        stack.push(f)
      end

    end


  end

  def self.is_operation(operation)
   operation.match(/[\*+-\/\^]/) == nil ? false: true
  end
  
  def self.is_number(num)
   num.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) == nil ? false : true
  end
end
