require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    list = List.new
    rpn_string.split(/\s/).each { |item| list.push(item)}
    list
  end

  def self.evaluate(rpn_list)
    index = 0
    stack = Stack.new

    while index < rpn_list.length
      item = rpn_list[index]

      if RPNCalculator.is_number item
        stack.push item.to_f
      elsif RPNCalculator.is_operation item
        right_num = stack.pop
        left_num = stack.pop

        unless left_num.is_a? Numeric and right_num.is_a? Numeric
          raise ArgumentError
        end

        if item == '^'
          val = left_num.public_send :**, right_num
        else
          val = left_num.public_send item.to_sym, right_num
        end
        stack.push val
      else
        raise ArgumentError.new
      end

      index += 1
    end

    raise ArgumentError if stack.length != 1
    ret_val = stack.pop

    raise ArgumentError unless ret_val.is_a? Numeric

    ret_val
  end

  def self.is_operation(operation)
    /\A[\^*+-\/]\z/.match(operation) != nil ? true : false
  end
  
  def self.is_number(num)
    /\A[+-]?([\d])+[.]?[\d]*\z/.match(num) != nil ? true : false
  end
end
