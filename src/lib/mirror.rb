require_relative "vector"
require_relative "shape"

def mirror_vector(height, vector)
  Vector::new(vector.x, height - vector.y)
end

# mirror : Vector -> Vector
def mirror_shape(mirror, shape)
  if shape.instance_of?(Shape::Line)
    Shape::Line::new(mirror.(shape.lineStart), mirror.(shape.lineEnd))
  elsif shape.instance_of?(Shape::Polygon)
    Shape::Polygon::new(shape.points.map { |p| mirror.(p) })
  elsif shape.instance_of?(Shape::PolyLine)
      Shape::PolyLine::new(shape.pts.map { |p| mirror.(p) })
  else
    shape
  end
end
