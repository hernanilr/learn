# frozen_string_literal: true

def are_you_there
  puts 'are you there?'
  yield
  puts 'how are you?'
end

def my_name(name)
  puts "hey, #{name}"
  yield('frank')
  puts 'lovely wether?'
end

def this_ok?(num1, num2)
  puts "i beleave the sum is #{num1 + num2}"
  out = yield(num1 + num2)
  if out == num1 + num2
    puts 'ok! i agree'
  else
    puts 'sorry! error'
  end
end

are_you_there { puts 'yes! i am here.' }
my_name('nic') { |n| puts "nice to see you, #{n}" }
this_ok?(2, 2) { |s| s + 1 }
this_ok?(3, 2) { |s| s * 1 }
