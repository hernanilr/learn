# frozen_string_literal: true

# Modules are made up of methods and variables, but they can't be instantiated
# They are used to add functionality to a class

# Allows you access to the Human module (Ruby 2+)
require './zhuman'
require './zsmart'

# module Animal
module Animal
  # class << self
  class << self
    attr_writer :pets
    def pets
      @pets ||= []
    end

    def registo(ana)
      pets << ana
    end
  end

  def make_sound
    'module Smart instance method make_sound ' + Animal.pets + ' E = mc²'
  end
end

# You can inherit a modules methods with prepend or include
# You can inherit from numerous methods instead of one class

# class Dog
class Dog
  include Animal
  attr_accessor :name
  def initialize(name)
    @name = name
    Animal.registo(self)
  end
end

# rover = Dog.new
# rover.make_sound

# class Scientist
class Scientist
  include Human
  prepend Smart # Any methods in Smart will superseed those in the class

  def act_smart
    'class Scientist instance method act_smart ' + Smart.quant.to_s + ' E = mc²'
  end
end

# einstein = Scientist.new
# einstein.name = 'Albert'
# puts einstein.name
# einstein.run
# puts einstein.name + ' says ' + einstein.act_smart

# --------------- POLYMORPHISM ---------------

# class Bird
class Bird
  def tweet(bird_type)
    bird_type.tweet
  end
end

# class Cardinal < Bird
class Cardinal < Bird
  def tweet
    puts 'Tweet tweet'
  end
end

# class Parrot < Bird
class Parrot < Bird
  def tweet
    puts 'Squawk'
  end
end

# Statically typed languages use duck typing to achieve polymorphism
# Ruby pays less attention to the class type versus the methods that can
# be called on it

# generic_bird = Bird.new
# generic_bird.tweet(Cardinal.new)
# generic_bird.tweet(Parrot.new)
