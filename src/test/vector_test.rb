require "test/unit"

require_relative "../lib/vector"

class TestVector < Test::Unit::TestCase
  def test_addition
    u = Vector.new(1, 0)
    v = Vector.new(0, 2)

    w = add u, v;

    assert_equal(1, w.x)
    assert_equal(2, w.y)
  end

  def test_negation
    u = Vector.new(1, 2)

    w = neg u;

    assert_equal(-1, w.x)
    assert_equal(-2, w.y)
  end

  def test_subtraction
    u = Vector.new(1, 0)
    v = Vector.new(0, 2)

    w = sub u, v;

    assert_equal(1, w.x)
    assert_equal(-2, w.y)
  end

  def test_scalar_multiplication
    u = Vector.new(1, 2)

    w = scale 2, u;

    assert_equal(2, w.x)
    assert_equal(4, w.y)
  end

  def test_length
    u = Vector.new(3, 4)

    l = length u

    assert_equal(5.0, l)
  end
end
