require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator

  # Parse should return a list class that you defined, not a ruby array
  def self.parse(rpn_string)
    array = rpn_string.split(" ")
  end


  def self.evaluate(rpn_list)
    stack = Stack.new

    rpn_list.each do |item|
      if is_operation?(item)
        item = "**" if item == "^"
        num2 = stack.pop.to_f
        num1 = stack.pop.to_f

        new_num = num1.public_send(item, num2)
        stack.push(new_num)
      elsif is_number?(item)
        stack.push(item)
      end
    end
    stack.pop
  end

  def self.is_operation?(operation)
    operations = ["+","-","*","/","^"]

    operations.include? operation
  end

  def self.is_number?(num)
    num.split("").each do |char|
      unless char.match(/(\d|-|\.)/)
        return false
      end
    end
    true
  end
end
