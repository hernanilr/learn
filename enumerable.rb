# frozen_string_literal: true

# class VowelFinder
class VowelFinder
  include Enumerable
  def set(str)
    @string = str
  end

  def initialize(str)
    @string = str
  end

  def each
    @string.scan(/[aeiou]/) { |v| yield v }
  end

  def <=>(other)
    self > other
  end
end

vf = VowelFinder.new('the quick brown fox jumped')
vf.inject { |v, n| v + n }
