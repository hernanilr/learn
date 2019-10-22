# frozen_string_literal: true

l1 = %w[a b c]
# l2 = l1.map { |e| e.upcase }
l2 = l1.map(&:upcase)

l3 = [2, 4, 7]

p l2

# p(l3.all? {|e| e.even? })
# p(l3.group_by {|e| e.even? })
p(l3.all?(&:even?))
p(l3.group_by(&:even?))

lm1 = -> { 2 * 2 }
p lm1.call

lm2 = proc { |i| i * i }
p lm2.call(2)

lm3 = proc { |e| e.upcase }
p l1.map(&lm3)
p l1.map(&lm3)
