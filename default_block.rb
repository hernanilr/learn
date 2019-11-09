# frozen_string_literal: true

# named block passed as param
def duas1(action)
  action.call
  action.call
end

# default block called using yield
# yield == default_block.call
def duas2
  # calls the default_block
  yield 1
  yield 2
end
# passing blocks to methods explicitly
# diz_ola = proc { puts 'hi!' }
# duas1(diz_ola)
# duas1(proc { puts 'hi2!' })
# passing blocks to methods implicitly
# with default_block
# duas2 { |v| puts "default block #{v} hi2!" }

# block is passed as default
# with extra normal method param
def cada1(array)
  i = 0
  while i < array.size
    yield array[i]
    i += 1
  end
  array
end

# call proc in the default_block & store in variable
# creats a proc pointed to by variable
# with extra normal method param
def cada2(array, &myproc)
  i = 0
  while i < array.size
    myproc.call(array[i])
    i += 1
  end
  array
end

# block is passed as default
# block can return expression
def mapa(array)
  i = 0
  oarray = []
  while i < array.size
    oarray << yield(array[i])
    i += 1
  end
  oarray
end

myproc = proc { |e| puts "turns a proc into the default_block, #{e}" }
num = [1, 2]
cada1(num) { |e| puts "method cada1 with array and default_block, #{e}" }
cada2(num) { |e| puts "method cada2 with array and default_block, #{e}" }
cada1(num, &myproc)
cada2(num, &myproc)

nomes = %w[hernani luis gomes rodrigues]

# equivalente mapa(nomes) { |e| e.reverse }
mapa(nomes, &:reverse)
