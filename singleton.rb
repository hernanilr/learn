# frozen_string_literal: true

# class Vehicle
class Vehicle
  # instance attr
  attr_accessor :kms

  def initialize(kms)
    @kms = kms
    puts 'ini ' + self.class.to_s
    self.class.register(self)
  end

  def meuattr
    # implicit receiver does not work in attr_writers
    # explicit receiver (self) is needed otherwise
    # local variable is assigned instead os attr method
    self.kms += 1
  end

  def drive
    puts "let's go! #{kms}"
  end
end

# access singleton class os Vehicle
class << Vehicle
  # singleton attr (for all instances)
  attr_writer :registry

  # just to assign [] the first time
  def registry
    @registry ||= []
  end

  def register(veh)
    puts 'registar: ' + inspect
    registry << veh
  end
end

# class Car < Vehicle
class Car < Vehicle
  # class << self
  class << self
    def registry
      # super equivalente self.super
      # obter Vehicle singleton registry
      superclass.registry
    end

    def register(car)
      car.kms += 1
      # adicionar a Vehicle singleton registry
      superclass.register(car)
    end
  end

  def horn
    puts 'buuu boooo!'
  end
end

# class Bowdlerize
class Bowd
  def initialize(str)
    @value = str.gsub(/[aeiou]/, '*')
  end

  def +(other)
    Bowd.new(to_s + other.to_s)
  end

  def to_s
    @value
  end
end
