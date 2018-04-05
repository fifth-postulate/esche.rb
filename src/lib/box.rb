require_relative "vector"

Box = Struct.new(:a, :b, :c)

def turn_box(box)
  Box.new(
    add(box.a, box.b),
    box.c,
    neg(box.b)
  )
end

def flip_box(box)
  Box.new(
    add(box.a, box.b),
    neg(box.b),
    box.c
  )
end

def toss_box(box)
  Box.new(
    add(box.a, scale(0.5, add(box.b, box.c))),
    scale(0.5, add(box.b, box.c)),
    scale(0.5, sub(box.c, box.b))
  )
end
