# frozen_string_literal: true

hell1 = proc { |a, b, c| puts "this is proc1 #{a},#{b},#{c}" }
hell2 = ->(a, b, c) { puts "this is proc1 #{a},#{b},#{c}" }
hell1.call
hell2.call(1, 2, 3)

def run_proc(pro)
  puts 'start'
  pro.call
  puts "fim\n\n"
end

# proc return de onde foi defenido
run_proc(proc { puts 'sou um proc'; return })
run_proc(-> { puts 'sou um lambda'; return })
