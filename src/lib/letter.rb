require_relative "vector"
require_relative "shape"

def outer_d_shape
  points = [
    Vector::new(0.3, 0.2),
    Vector::new(0.3, 0.5),
    Vector::new(0.4, 0.6),
    Vector::new(0.6, 0.6),
    Vector::new(0.6, 0.9),
    Vector::new(0.7, 0.9),
    Vector::new(0.7, 0.1),
    Vector::new(0.4, 0.1)
  ]
  Shape::Polygon::new(points)
end

def inner_d_shape
  points = [
    Vector::new(0.40, 0.24),
    Vector::new(0.40, 0.46),
    Vector::new(0.44, 0.50),
    Vector::new(0.60, 0.50),
    Vector::new(0.60, 0.20),
    Vector::new(0.44, 0.20)
  ]
  Shape::Polygon::new(points)
end

def d_shapes
  outer = outer_d_shape()
  inner = inner_d_shape()
  [outer, inner]
end

module Letter
  D = d_shapes()
end
