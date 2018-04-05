require_relative "lib/vector"
require_relative "lib/box"
require_relative "lib/letter"
require_relative "lib/fish"
require_relative "lib/picture"
require_relative "lib/fitting"
require_relative "lib/rendering"

box = Box.new(
	Vector.new(75.0, 75.0),
	Vector.new(250.0, 0.0),
	Vector.new(0.0, 250.0)
	)
shapes = Letter::D
d = create_picture(shapes)
picture = above(d, flip(d))
puts to_svg([400, 400], picture.(box))
