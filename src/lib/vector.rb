Vector = Struct.new(:x, :y)

def add(u, v)
  Vector::new(u.x + v.x, u.y + v.y)
end

def neg(u)
  Vector::new(-u.x, -u.y)
end

def sub(u, v)
  add(u, neg(v))
end

def scale(factor, u)
  Vector::new(factor * u.x, factor * u.y)
end

def length(u)
  Math.sqrt(u.x * u.x + u.y * u.y)
end
