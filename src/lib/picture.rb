# type alias Rendering = List (Shape, Style)
# type alias Picture = Box -> Rendering
#
# We will use lambda to create a `Picture`

require_relative "vector"
require_relative "box"

def blank
  lambda { |box| [ ] }
end

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

def toss(picture)
  lambda { |box|
    b = toss_box(box)
    picture.(b)
  }
end

def above_ratio(m, n, pm, pn)
  lambda { |box|
    factor = m.to_f() / (m + n).to_f()
    boxm, boxn = split_vertically(factor, box)
    pm.(boxm) + pn.(boxn)
  }
end

def above (pm, pn)
  above_ratio(1, 1, pm, pn)
end

def beside_ratio(m, n, pm, pn)
  lambda { |box|
    factor = m.to_f() / (m + n).to_f()
    boxm, boxn = split_horizontally(factor, box)
    pm.(boxm) + pn.(boxn)
  }
end

def beside (pm, pn)
  beside_ratio(1, 1, pm, pn)
end

def quartet(nw, ne, sw, se)
  above(beside(nw, ne), beside(sw, se))
end

def row(w, m, e)
  beside_ratio(1, 2, w, beside(m, e))
end

def column(n, m, s)
  above_ratio(1, 2, n, above(m, s))
end

def nonet(nw, nm, ne, mw, mm, me, sw, sm, se)
  column(row(nw, nm, ne), row(mw, mm, me), row(sw, sm, se))
end

def over(p, q)
  lambda { |box|
    p.(box) + q.(box)
  }
end

def ttile(p)
  f = flip(toss(p))
  over(p, over(f,turn(turn(turn(f)))))
end

def utile(p)
  f = flip(toss(p))
  g = over(f, turn(f))
  over(g, turn(turn(g)))
end

def side(n, p)
  if n == 0 then
    blank()
  else
    se = ttile(p)
    sw = turn(se)
    ne = side(n - 1, p)
    nw = ne

    quartet(nw, ne, sw, se)
  end
end

def corner(n, p)
  if n == 0 then
    blank()
  else
    nw = corner(n - 1, p)
    ne = side(n - 1, p)
    sw = turn(ne)
    se = utile(p)

    quartet(nw, ne, sw, se)
  end
end
