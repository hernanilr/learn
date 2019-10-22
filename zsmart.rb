# frozen_string_literal: true

# module Smart
module Smart
  def act_smart
    'module Smart instance method act_smart ' + Smart.quant.to_s + ' E = mc²'
  end
end

# class << self
class << Smart
  attr_accessor :quant
end
