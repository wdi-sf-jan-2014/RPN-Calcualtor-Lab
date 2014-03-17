require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator

  # Parse should return a list class that you defined, not a ruby array
  def self.parse(rpn_string)
    arr = rpn_string.split(" ")
    list = List.new()
    arr.each { |num| list.push(num) }
    return list
  end

  def self.evaluate(rpn_list)
  end

  def self.is_operation(operation)
  end

  def self.is_number(num)
    if num.match([\*\/\+\-\^])
      return true
    else
      return false
    end
  end
end
