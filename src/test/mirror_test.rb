require "test/unit"

require_relative "../lib/mirror"
require_relative "../lib/shape"

class TestMirror < Test::Unit::TestCase
  def test_mirror_vector
    height = 5.0
    v = Vector::new(1.0, 3.0)

    w = mirror_vector(height, v)

    assert_equal(Vector::new(1.0, 2.0), w)
  end

  def test_mirror_shape_line
    mirror = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::Line::new(Vector::new(1.0, 2.0), Vector::new(3.0, 4.0))

    s = mirror_shape(mirror, shape)

    assert_equal(s, Shape::Line::new(Vector::new(1.0, 3.0), Vector::new(3.0, 1.0)))
  end

  def test_mirror_shape_polygon
    mirror = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::Polygon::new([Vector::new(1.0, 2.0), Vector::new(3.0, 4.0)])

    s = mirror_shape(mirror, shape)

    assert_equal(s, Shape::Polygon::new([Vector::new(1.0, 3.0), Vector::new(3.0, 1.0)]))
  end

  def test_mirror_shape_polyline
    mirror = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::PolyLine::new([Vector::new(1.0, 2.0), Vector::new(3.0, 4.0)])

    s = mirror_shape(mirror, shape)

    assert_equal(s, Shape::PolyLine::new([Vector::new(1.0, 3.0), Vector::new(3.0, 1.0)]))
  end
end
