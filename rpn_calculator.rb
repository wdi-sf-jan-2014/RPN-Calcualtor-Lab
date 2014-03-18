require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    arr = rpn_string.split(" ")
    return arr
  end

  def self.evaluate(rpn_list)
    stack = Stack.new
    rpn_list.each do |x|
      if self.is_number(x)
        stack.push(x.to_f)
      elsif self.is_operation(x)
        operator = x
        num1 = stack.pop
        num2 = stack.pop
        value = num2.public_send(operator, num1)
        stack.push(value)
      end
  end

  def self.is_operation(operation)
    operations = ["+", "-", "*", "/", "^"]
    if operations.include?(operation)
      return true
    else
      return false
    end
  end
  
  def self.is_number(num)
    if num.match(/[-+]?[0-9]*\.?[0-9]/)
      return true
    else
      return false
    end
  end
end
