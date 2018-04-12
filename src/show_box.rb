require_relative "lib/vector"
require_relative "lib/box"
require_relative "lib/rendering"

box = Box.new(
	Vector.new(75.0, 75.0),
	Vector.new(250.0, 0.0),
	Vector.new(0.0, 250.0)
)
puts show_box([400, 400], box)
