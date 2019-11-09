# frozen_string_literal: true

def fact(nnn)
  raise 'argument must be positive' if nnn < 1
  return 1 if nnn == 1

  nnn * fact(nnn - 1)
end

def polar(xxx, yyy)
  [Math.hypot(yyy, xxx), Math.atan2(yyy, xxx)]
end

def cartesian(magnitude, angle)
  [magnitude * Math.cos(angle), magnitude * Math.sin(angle)]
end

x = 1
y = 1

distance, theta = polar(x, y)
x, y = cartesian(distance, theta)

puts x, y
