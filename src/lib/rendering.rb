require_relative "mirror"

def to_polygon_element(style, vectors)
  coordinates = vectors.map { |v| "#{v.x},#{v.y}" }
  return <<TOPOLYGON
  <polygon stroke="black" stroke-width="#{style.stroke_width}" fill="none" points="#{coordinates.join(" ")}" />
TOPOLYGON
end

def to_svg_element(style, shape)
  if shape.instance_of?(Shape::Polygon)
    to_polygon_element(style, shape.points)
  # elsif shape.instance_of?(Shape::Polygon)
  #   Shape::Polygon::new(shape.points.map { |p| m.(p) })
  # elsif shape.instance_of?(Shape::PolyLine)
  #   Shape::PolyLine::new(shape.pts.map { |p| m.(p) })
  # elsif shape.instance_of?(Shape::Curve)
  #   Shape::Curve::new(
  #     m.(shape.point1),
  #     m.(shape.point2),
  #     m.(shape.point3),
  #     m.(shape.point4)
  #   )
  # elsif shape.instance_of?(Shape::Path)
  #   Shape::Path::new(
  #     m.(shape.start),
  #     shape.beziers.map { |p|
  #       Shape::Proto::BezierShape::new(
  #         m.(p.controlPoint1),
  #         m.(p.controlPoint2),
  #         m.(p.endPoint),
  #       )
  #     }
  #   )
  else
    return <<ENDPART
  <text></text>
ENDPART
  end
end

def to_svg(bounds, rendering)
	w = bounds[0]
	h = bounds[1]
  mirror = lambda { |v| mirror_vector(h, v) }
  svgs = rendering.map { |render|
    shape = render[0]
    style = render[1]
    to_svg_element style, mirror_shape(mirror, shape)
  }
	return <<ENDSVG
<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 #{w} #{h}">
#{svgs.join("")}
</svg>
ENDSVG
end
