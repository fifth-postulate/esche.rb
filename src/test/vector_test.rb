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
end
