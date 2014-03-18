require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    rpn_array = rpn_string.split(' ')
    rpn_list = Stack.new
    for el in rpn_array do
      rpn_list.push(el)
    end

    return rpn_list
  end

  def self.is_number(num)
    !!(num =~ /^[-+]?[0-9]+$/)
  end

  def self.is_operation(operation)
    operation == "+" || operation == "-" || operation == "*" || operation == "/" || operation == "^"
  end

  def self.evaluate(rpn_list)

    return nil if rpn_list.length == 0
    calc = Stack.new

    i = 0
    while i < rpn_list.length
      if is_number(rpn_list[i])
        calc.push(rpn_list[i].to_f)
      elsif is_operation(rpn_list[i])
        b = calc.pop.to_f
        a = calc.pop.to_f
        temp_result = a.public_send(rpn_list[i].to_sym, b)
        calc.push(temp_result)
      end
      i += 1
    end

    return calc.pop
  end

end
