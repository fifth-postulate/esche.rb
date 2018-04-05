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
