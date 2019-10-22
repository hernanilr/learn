# frozen_string_literal: true

arr = [1, 2, 3, 4]
arr.each { |a| puts a }

def run_block
  yield if block_given?
end
run_block { puts 'ola' }

def fib(max)
  i1 = 1
  i2 = 1
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end

fib(500) { |f| print f, ' ' }
puts ''

a = []
fib(700) { |val| a << val }
puts a.inspect

def into(arr)
  proc { |val| arr << val }
end

a = []
fib(2000, &into(a))
puts a.inspect
