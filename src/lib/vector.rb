Vector = Struct.new(:x, :y)

def add(u, v)
  Vector::new(u.x + v.x, u.y + v.y)
end
