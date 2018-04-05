# type alias Rendering = List (Shape, Style)
# type alias Picture = Box -> Rendering
#
# We will use lambda to create a `Picture`

require_relative "vector"
require_relative "box"

def turn(picture)
  lambda { |box|
    b = turn_box(box)
    picture.(b)
  }
end

def flip(picture)
  lambda { |box|
    b = flip_box(box)
    picture.(b)
  }
end

def toss(picture)
  lambda { |box|
    b = toss_box(box)
    picture.(b)
  }
end

def above_ratio(m, n, pm, pn)
  lambda { |box|
    factor = m.to_f() / (m + n).to_f()
    boxm, boxn = split_vertically(factor, box)
    pm.(boxm) + pn.(boxn)
  }
end

def above (pm, pn)
  above_ratio(1, 1, pm, pn)
end
