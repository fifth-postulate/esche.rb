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

def move_vertically(factor, box)
  Box.new(
    add(box.a, scale(factor, box.c)),
    box.b,
    box.c
  )
end

def scale_vertically(factor, box)
  Box.new(
    box.a,
    box.b,
    scale(factor, box.c)
  )
end

def split_vertically(factor, box)
  top = scale_vertically(factor, move_vertically(1.0 - factor, box))
  bottom = scale_vertically(1.0 - factor, box)
  return top, bottom
end

def move_horizontally(factor, box)
  Box.new(
    add(box.a, scale(factor, box.b)),
    box.b,
    box.c
  )
end

def scale_horizontally(factor, box)
  Box.new(
    box.a,
    scale(factor, box.b),
    box.c
  )
end

def split_horizontally(factor, box)
  right = scale_horizontally(1.0 - factor, move_horizontally(factor, box))
  left = scale_horizontally(factor, box)
  return left, right
end