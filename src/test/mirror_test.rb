require "test/unit"

require_relative "../lib/mirror"

class TestMirror < Test::Unit::TestCase
  def test_mirror_vector
    height = 5.0
    v = Vector::new(1.0, 3.0)

    w = mirror_vector(height, v)

    assert_equal(Vector::new(1.0, 2.0), w)
  end
end
