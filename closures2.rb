# frozen_string_literal: true

def multiple_generator(mul)
  ->(num) { num * mul }
end

dub = multiple_generator(2)
tri = multiple_generator(3)

# call pode ser subtituido por []
puts dub.call(5)
puts tri[10]
