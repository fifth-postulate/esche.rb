module Shape
  module Proto
    BezierShape = Struct::new(:controlPoint1, :controlPoint2, :endPoint)
  end

  Line = Struct::new(:lineStart, :lineEnd)

  Polygon = Struct::new(:points)

  PolyLine = Struct::new(:pts)

  Curve = Struct::new(:point1, :point2, :point3, :point4)

  Path = Struct::new(:start, :beziers)
end
