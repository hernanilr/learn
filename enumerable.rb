# frozen_string_literal: true

# module Summable
module Summable
  def soma
    # a class deve ter acesso a Enumerable.inject
    inject { |v, n| v + n }
  end
end

# class VowelFinder
class VowelFinder
  include Enumerable
  include Summable
  def set(str)
    @string = str
  end

  def initialize(str)
    @string = str
  end

  def each
    if block_given?
      @string.scan(/[aeiou]/) { |n| yield n }
    else
      # returns enumerator
      @string.scan(/[aeiou]/).each
    end
  end

  def <=>(other)
    self > other
  end
end

# class Array
class Array
  include Summable
end

vf = VowelFinder.new('the quick brown fox jumped')
puts [1, 2, 3, 4, 5].soma
puts(vf.inject { |v, n| v + n })
puts(vf.soma { |v, n| v + n })
