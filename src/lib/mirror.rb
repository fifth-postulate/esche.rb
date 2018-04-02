require_relative "vector"
require_relative "shape"

def mirror_vector(height, vector)
  Vector::new(vector.x, height - vector.y)
end

# mirror : (Vector -> Vector) -> Shape -> Shape
def mirror_shape(mirror, shape)
  if shape.instance_of?(Shape::Line)
    Shape::Line::new(mirror.(shape.lineStart), mirror.(shape.lineEnd))
  elsif shape.instance_of?(Shape::Polygon)
    Shape::Polygon::new(shape.points.map { |p| mirror.(p) })
  elsif shape.instance_of?(Shape::PolyLine)
      Shape::PolyLine::new(shape.pts.map { |p| mirror.(p) })
  elsif shape.instance_of?(Shape::Curve)
    Shape::Curve::new(
      mirror.(shape.point1),
      mirror.(shape.point2),
      mirror.(shape.point3),
      mirror.(shape.point4)
    )
  elsif shape.instance_of?(Shape::Path)
    Shape::Path::new(
      mirror.(shape.start),
      shape.beziers.map { |p|
        Shape::Proto::BezierShape::new(
          mirror.(p.controlPoint1),
          mirror.(p.controlPoint2),
          mirror.(p.endPoint),
        )
      }
    )
  else
    shape
  end
end
