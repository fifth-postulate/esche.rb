require_relative "vector"
require_relative "box"
require_relative "style"

def mapper(box)
  lambda { |v| add(box.a, add(scale(v.x, box.b), scale(v.y, box.c))) }
end

def get_stroke_width(box)
  [length(box.b), length(box.c)].max() / 80.0
end

def get_style(box)
  Style::new(get_stroke_width(box))
end

def map_shape(m, shape)
  if shape.instance_of?(Shape::Line)
    Shape::Line::new(m.(shape.lineStart), m.(shape.lineEnd))
  elsif shape.instance_of?(Shape::Polygon)
    Shape::Polygon::new(shape.points.map { |p| m.(p) })
  elsif shape.instance_of?(Shape::PolyLine)
    Shape::PolyLine::new(shape.pts.map { |p| m.(p) })
  elsif shape.instance_of?(Shape::Curve)
    Shape::Curve::new(
      m.(shape.point1),
      m.(shape.point2),
      m.(shape.point3),
      m.(shape.point4)
    )
  elsif shape.instance_of?(Shape::Path)
    Shape::Path::new(
      m.(shape.start),
      shape.beziers.map { |p|
        Shape::Proto::BezierShape::new(
          m.(p.controlPoint1),
          m.(p.controlPoint2),
          m.(p.endPoint),
        )
      }
    )
  else
    shape
  end
end

def create_picture(shapes)
  lambda { |box|
    m = mapper(box)
    style = get_style(box)
    shapes
      .map { |shape| map_shape(m, shape)  }
      .map { |shape| [shape, style] }
  }
end
