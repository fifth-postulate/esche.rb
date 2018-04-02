require "test/unit"

require_relative "../lib/fitting"

class TestFitting < Test::Unit::TestCase
  def test_map_shape_line
    m = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::Line::new(Vector::new(1.0, 2.0), Vector::new(3.0, 4.0))

    s = map_shape(m, shape)

    assert_equal(s, Shape::Line::new(Vector::new(1.0, 3.0), Vector::new(3.0, 1.0)))
  end

  def test_map_shape_polygon
    mapping = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::Polygon::new([Vector::new(1.0, 2.0), Vector::new(3.0, 4.0)])

    s = map_shape(mapping, shape)

    assert_equal(s, Shape::Polygon::new([Vector::new(1.0, 3.0), Vector::new(3.0, 1.0)]))
  end

  def test_map_shape_polyline
    mapping = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::PolyLine::new([Vector::new(1.0, 2.0), Vector::new(3.0, 4.0)])

    s = map_shape(mapping, shape)

    assert_equal(s, Shape::PolyLine::new([Vector::new(1.0, 3.0), Vector::new(3.0, 1.0)]))
  end

  def test_map_shape_curve
    mapping = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::Curve::new(
      Vector::new(1.0, 2.0),
      Vector::new(3.0, 4.0),
      Vector::new(5.0, 6.0),
      Vector::new(7.0, 8.0)
    )

    s = map_shape(mapping, shape)

    assert_equal(s, Shape::Curve::new(
                   Vector::new(1.0, 3.0),
                   Vector::new(3.0, 1.0),
                   Vector::new(5.0, -1.0),
                   Vector::new(7.0, -3.0)
                 ))
  end

  def test_map_shape_path
    mapping = lambda { |v| mirror_vector(5.0, v) }
    shape = Shape::Path::new(
      Vector::new(-1.0, 0.0), [
        Shape::Proto::BezierShape::new(
          Vector::new(1.0, 2.0),
          Vector::new(3.0, 4.0),
          Vector::new(5.0, 6.0)
        )
      ])

    s = map_shape(mapping, shape)

    assert_equal(s, Shape::Path::new(
                   Vector::new(-1.0, 5.0), [
                     Shape::Proto::BezierShape::new(
                       Vector::new(1.0, 3.0),
                       Vector::new(3.0, 1.0),
                       Vector::new(5.0, -1.0)
                     )
                   ]))
  end
end
