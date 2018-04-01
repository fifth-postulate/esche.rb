require_relative "vector"
require_relative "shape"

def mirror_vector(height, vector)
  Vector::new(vector.x, height - vector.y)
end

# mirror : Vector -> Vector
def mirror_shape(mirror, shape)
  if shape.instance_of?(Shape::Line)
    Shape::Line::new(mirror.(shape.lineStart), mirror.(shape.lineEnd))
  else
    shape
  end
end
