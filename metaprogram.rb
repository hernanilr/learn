# frozen_string_literal: true

# class MyClass
class MyClass
  def my_method1(text)
    puts "my method #1: #{text}"
  end

  def my_method2(text)
    puts "my method #2: #{text}"
  end
end

obj1 = MyClass.new
obj1.my_method1('testo teste')
obj1.send(:my_method2, 'testo teste send')
