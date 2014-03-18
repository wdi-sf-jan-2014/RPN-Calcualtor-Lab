require './stack.rb'
require 'pry'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    rpn_string.split(" ")
  end

  def self.evaluate(rpn_list)
    stack = Stack.new

    rpn_list.each do |i|
      if RPNCalculator.is_number(i)
        stack.push(i).to_f
      end
      if RPNCalculator.is_operation(i)
        y = stack.pop.to_f
        x = stack.pop.to_f
        stack.push((x).method(i).(y))
      end
    end

    return stack.pop

  end

  def self.is_operation(operation)
    if operation.match(/[^\d\w\s"=]/) then return true else return false end
  end
  
  def self.is_number(num)
    if num.match(/[\d]+/) then return true else return false end
  end

end