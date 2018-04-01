require_relative "vector"

def mirror_vector(height, vector)
  Vector::new(vector.x, height - vector.y)
end
