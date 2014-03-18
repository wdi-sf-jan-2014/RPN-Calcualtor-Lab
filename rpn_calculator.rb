require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    rpn_list = Stack.new
    array = rpn_string.split(" ")
    array.each do |el|
      rpn_list.push(el)
    end
    return rpn_list
  end

  def self.evaluate(rpn_list)
    
  end

  def self.is_operation(operation)
    # if operation.match(/[\/+-\\*]/) then return true else return false end
    if operation.match(/[^\d\w\s"]/) then return true else return false end
  end
  
  def self.is_number(num)
    if num.match(/[\d]+/) then return true else return false end
  end
end
