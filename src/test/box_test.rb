require "test/unit"

require_relative "../lib/box"
require_relative "../lib/vector"

class TestBox < Test::Unit::TestCase
  def test_turn_box
    box = Box.new(Vector.new(1.0, 1.0), Vector.new(2.0, 0.0), Vector.new(0.0, 3.0))

    b = turn_box(box)

    assert_equal(b, Box.new(Vector.new(3.0, 1.0), Vector.new(0.0, 3.0), Vector.new(-2.0, 0.0)))
  end

  def test_flip_box
    box = Box.new(Vector.new(1.0, 1.0), Vector.new(2.0, 0.0), Vector.new(0.0, 3.0))

    b = flip_box(box)

    assert_equal(b, Box.new(Vector.new(3.0, 1.0), Vector.new(-2.0, 0.0), Vector.new(0.0, 3.0)))
  end
end
