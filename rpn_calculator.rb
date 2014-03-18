require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    rpn_string.split(" ")
    stack = Stack.new()
    rpn_string.each do |f|
      stack.push(f)
    end
  end

  def self.evaluate(rpn_list)

  end

  def self.is_operation(operation)
   operation.match(/[\*+-\/\^]/) == nil ? false: true
  end
  
  def self.is_number(num)
   num.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) == nil ? false : true
  end
end
