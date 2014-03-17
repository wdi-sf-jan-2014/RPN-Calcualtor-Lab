require 'rspec'
require './stack.rb'
require 'pry'

describe Stack do
  let(:stack) { Stack.new }

  it 'should have push, pop and length' do
    expect(stack).to respond_to(:push).with(1).argument
    expect(stack).to respond_to(:pop)
    expect(stack).to respond_to(:length)
  end

  it 'should push and pop from the end of the stack' do
    stack.push(1)
    expect(stack.length).to eq(1)
    stack.push(2)
    expect(stack.length).to eq(2)
    stack.push(3)
    expect(stack.length).to eq(3)
    expect(stack.pop).to eq(3)
    expect(stack.length).to eq(2)
    expect(stack.pop).to eq(2)
    expect(stack.length).to eq(1)
    expect(stack.pop).to eq(1)
    expect(stack.length).to eq(0)

    expect(stack.pop).to be_nil
    expect(stack.length).to eq(0)
  end
end
