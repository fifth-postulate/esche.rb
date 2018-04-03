def to_svg(bounds)
	w = bounds[0]
	h = bounds[1]
	return <<ENDSVG
<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 #{w} #{h}">
</svg>
ENDSVG
end