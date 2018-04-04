require_relative "mirror"

def to_svg_element(style, shape)
  return <<ENDPART
  <circle cx="10" cy="10" r="10">
ENDPART
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
