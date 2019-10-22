# frozen_string_literal: true

tracer = TracePoint.new(:return) do |tp|
  to_display = { ev: tp.event, fi: File.basename(tp.path),
                 li: tp.lineno, kl: tp.defined_class, id: tp.method_id }
  puts format('%<ev>10s in %<fi>s at line %<li>-2d %<kl>s-%<id>s', to_display)
end

# MyClass:w
#
class MyClass
  def my_method
    44
  end
end

foo = MyClass.new
tracer.enable do
  bar = foo.my_method
  puts bar
end
