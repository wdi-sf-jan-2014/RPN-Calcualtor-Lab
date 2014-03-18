#!/usr/bin/env ruby

require './rpn_calculator.rb'


def rpn_command_prompt
  while rpn_line = gets.chomp
    begin
      val = RPNCalculator.evaluate(RPNCalculator.parse(rpn_line))
      puts "= #{val}"
    rescue ArgumentError
      puts "Invalid RPN string"
    end
  end
end

def rpn_from_file(filename)
  File.open("./#{filename}", 'r').each_line do |l|
    begin
      val = RPNCalculator.evaluate(RPNCalculator.parse(l))
      puts "#{l} = #{val}"
    rescue ArgumentError
      puts "Invalid RPN string"
    end
  end
end


if ARGV.length > 0
  rpn_from_file ARGV[0]
else
  rpn_command_prompt
end
