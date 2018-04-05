require_relative "vector"

Box = Struct.new(:a, :b, :c)

def turn_box(box)
  Box.new(
    add(box.a, box.b),
    box.c,
    neg(box.b)
  )
end
