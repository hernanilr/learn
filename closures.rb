# frozen_string_literal: true

def run_proc(pro)
  pro.call
end

name = 'eu'
print_name = proc { puts name }
run_proc(print_name)

name = 'fruga'
run_proc(print_name)
