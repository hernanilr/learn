# frozen_string_literal: true

# class Order
class Order
  attr_accessor :email, :total, :status

  def initialize(email, total, status)
    @email = email
    @total = total
    @status = status
  end

  def to_s
    "#{email}: $#{total} (#{status})"
  end
end

orders = []
2.times do |n|
  orders << Order.new("eu#{n + 1}@fruga.pt", 10 + n, :pending)
end
3.upto(6) { |n| orders << Order.new("eu#{n}@fruga.pt", 10 + n, :closed) }
# puts orders
po, co = orders.partition { |o| o.status == :pending }
puts po
puts co
