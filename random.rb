# frozen_string_literal: true

# random
class Array
  def random_each
    shuffle.each { |e| yield(e) }
  end
end

arr = [1, 2, 3, 4, 5, 6]
arr.random_each { |e| puts e }
