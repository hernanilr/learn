# frozen_string_literal: true

class Chef
  def make_chicken
    puts 'The chef makes chicken'
  end

  def make_salad
    puts 'The chef makes salad'
  end

  def make_special_dish
    puts 'The chef makes a special dish'
  end
end

class ItalianChef < Chef
  def make_pasta
    puts 'The chef makes pasta'
  end

  def make_special_dish
    puts 'The chef makes chicken parm'
  end
end

my_chef = Chef.new
my_chef.make_chicken

my_italian_chef = ItalianChef.new
my_italian_chef.make_chicken
