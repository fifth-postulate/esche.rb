require_relative "mirror"

def to_polygon_element(style, vectors)
  coordinates = vectors.map { |v| "#{v.x},#{v.y}" }
  return <<TOPOLYGON
  <polygon stroke="black" stroke-width="#{style.stroke_width}" fill="none" points="#{coordinates.join(" ")}" />
TOPOLYGON
end

def to_polyline_element(style, vectors)
  coordinates = vectors.map { |v| "#{v.x},#{v.y}" }
  return <<TOPOLYLINE
  <polyline stroke="black" stroke-width="#{style.stroke_width}" fill="none" points="#{coordinates.join(" ")}" />
TOPOLYLINE
end


def to_polyline_element(style, v1, v2, v3, v4)
  coordinates = vectors.map { |v| "#{v.x},#{v.y}" }
  return <<TOCURVE
  <path stroke="black" stroke-width="#{style.stroke_width}" fill="none" d="M#{v1.x} #{v1.y} C #{v2.x} #{v2.y}, #{v3.x} #{v3.y}, #{v4.x} #{v4.y}" />
TOCURVE
end

def to_svg_element(style, shape)
  if shape.instance_of?(Shape::Polygon)
    to_polygon_element(style, shape.points)
  elsif shape.instance_of?(Shape::PolyLine)
    to_polyline_element(style, shape.pts)
  elsif shape.instance_of?(Shape::Curve)
   to_curve_element(style, shape.point1, shape.point2, shape.point3, shape.point4)
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
