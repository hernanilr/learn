# frozen_string_literal: true

# module Human
module Human
  # Creates setter and getter methods
  attr_accessor :name, :height

  def run
    'module Human instance method run ' + name + '|' + height.to_s
  end
end
