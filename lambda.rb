# frozen_string_literal: true

hell1 = proc { |a, b, c| puts "this is proc1 #{a},#{b},#{c}" }
# lambda verifies the number os parameters
hell2 = ->(a, b, c) { puts "this is proc1 #{a},#{b},#{c}" }
hell1.call
# lambda verifies the number os parameters
hell2.call(1, 2, 3)

def run_proc
  puts '(before yield) start method that calls block'
  yield
  puts "(after yield) fim do method que chamou block\n\n"
end

myp = proc {
  puts 'sou um proc'
  # proc returns from the method that calls it
  return
}
myl = lambda {
  puts 'sou um lambda'
  # lambda returns only from it
  return
}
run_proc(&myl)
run_proc(&myp)
