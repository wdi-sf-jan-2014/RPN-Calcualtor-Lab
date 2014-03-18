require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    arg_list = List.new
    rpn_string.split(' ').each {|arg| arg_list.push(arg)}
    return arg_list
  end

  def self.evaluate(rpn_list)
    calc_stack = Stack.new

    while (arg = rpn_list.shift)
      if (self.is_number(arg))
        calc_stack.push(arg.to_f)
      elsif (self.is_operation(arg))
        op = arg
        num2 = calc_stack.pop
        num1 = calc_stack.pop
        val = self.calc(num1, num2, op)
        calc_stack.push(val)
      end
    end
    return calc_stack.pop
  end

  def self.is_operation(operation)
    ops = ['+', '-', '^', '*', '/']
    return ops.include?(operation)
  end
  
  def self.is_number(num)
    return (Float(num) != nil rescue false)
  end

  private

  def self.calc(num1, num2, op)
    case op
    when '+'
      retval = num1 + num2
    when '-'
      retval = num1 - num2
    when '^'
      retval = num1 ** num2
    when '*'
      retval = num1 * num2
    when '/'
      retval = num1 / num2
    else
      retval = nil
    end

    return retval
  end
end

def get_user_input
  ended = false
  until ended 
    puts ("Enter an RPN expression to evaluate (or 'exit' to quit).")
    response = gets.chomp
    if response == 'exit'
      ended = true
    else
      puts("Result is: #{RPNCalculator.evaluate(RPNCalculator.parse(response))}")
    end
  end
end

def process_from_file(filename)
  puts("processing file: " + filename)
  File.open(filename) do |file|
    while line = file.gets
      puts("Result is: #{RPNCalculator.evaluate(RPNCalculator.parse(line))}")
    end
  end
end

if ARGV.size >= 1
  process_from_file(ARGV[0])
else
  get_user_input
end


