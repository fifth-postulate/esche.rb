require "test/unit"

require_relative "../lib/picture"

def chain(f, g)
  lambda { |x| g.call(f.call(x)) }
end

class TestLambda < Test::Unit::TestCase
  def test_calling_by_method_name
    increment = lambda { |x| x + 1 }

    assert_equal(6, increment.call(5))
  end

  def test_calling_by_indexing
    increment = lambda { |x| x + 1 }

    assert_equal(6, increment[5])
  end

  def test_calling_by_almost_calling
    increment = lambda { |x| x + 1 }

    assert_equal(6, increment.(5))
  end

  def test_higher_order
    times = lambda { |f, n|
      if n == 0 then
        lambda { |x| x }
      else
        chain(f, times.call(f, n-1))
      end
    }

    increment = lambda { |x| x + 1 }
    add_3 = times.call(increment, 3)

    assert_equal(3, add_3.call(0))
  end
end
