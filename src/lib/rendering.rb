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

def to_curve_element(style, v1, v2, v3, v4)
  return <<TOCURVE
  <path stroke="black" stroke-width="#{style.stroke_width}" fill="none" d="M#{v1.x} #{v1.y} C #{v2.x} #{v2.y}, #{v3.x} #{v3.y}, #{v4.x} #{v4.y}" />
TOCURVE
end

def to_line_element(style, u, v)
  return <<TOCURVE
  <line stroke="black" stroke-width="#{style.stroke_width}" fill="none" x1="#{u.x}" y1="#{u.y}" x2="#{v.x}" y2="#{v.y}" />
TOCURVE
end

def to_path_element(style, start, controls)
  segments = controls.map { |b| "C #{b.controlPoint1.x} #{b.controlPoint1.y}, #{b.controlPoint2.x} #{b.controlPoint2.y}, #{b.endPoint.x} #{b.endPoint.y}" }
  return <<TOPATH
  <path stroke="black" stroke-width="#{style.stroke_width}" fill="none" d="M#{start.x} #{start.y} #{segments.join(" ")}" />
TOPATH
end

def to_svg_element(style, shape)
  if shape.instance_of?(Shape::Polygon)
    to_polygon_element(style, shape.points)
  elsif shape.instance_of?(Shape::PolyLine)
    to_polyline_element(style, shape.pts)
  elsif shape.instance_of?(Shape::Curve)
   to_curve_element(style, shape.point1, shape.point2, shape.point3, shape.point4)
  elsif shape.instance_of?(Shape::Line)
    to_line_element(style, shape.lineStart, shape.lineEnd)
  elsif shape.instance_of?(Shape::Path)
    to_path_element(style, shape.start, shape.beziers)
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
