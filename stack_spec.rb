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

describe List do
  let(:list) {List.new}

  it 'should have push, pop, shift and length' do
    expect(list).to respond_to(:push).with(1).argument
    expect(list).to respond_to(:pop)
    expect(list).to respond_to(:shift)
    expect(list).to respond_to(:length)
  end

  it 'should push on end, shift from front' do
    list.push(1)
    expect(list.length).to eq(1)
    list.push(2)
    expect(list.length).to eq(2)
    list.push(3)
    expect(list.length).to eq(3)
    
    expect(list.shift).to eq(1)
    expect(list.length).to eq(2)
    expect(list.shift).to eq(2)
    expect(list.length).to eq(1)
    expect(list.shift).to eq(3)
    expect(list.length).to eq(0)

    expect(list.shift).to be_nil
    expect(list.length).to eq(0)
  end
end

