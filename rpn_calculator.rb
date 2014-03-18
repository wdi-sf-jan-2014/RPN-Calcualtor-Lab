require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    list = List.new
    rpn_string.split(" ").each do |el|
      list.push el
    end
    return list
  end

  def self.evaluate(rpn_list)
    stack = Stack.new
    while rpn_list.length > 0
      num = rpn_list.shift
      if RPNCalculator.is_number(num)
        stack.push num
      else
        num1 = stack.pop
        num2 = stack.pop
        num3 = num2.to_f.send(num, num1.to_f)
        stack.push num3
      end 
    end
    return stack.pop.to_f
  end

  def self.is_operation(operation)
    if operation.match /[\+\-\/\*\^]/ 
      return true
    else
      return false
    end
  end
  
  def self.is_number(num)
    if num.match /\d/
      return true
    else
      return false
    end
  end
end
