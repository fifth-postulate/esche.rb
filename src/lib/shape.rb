module Shape
  LineShape = Struct::new(:lineStart, :lineEnd)

  PolygonShape = Struct::new(:points)

  PolyLineShape = Struct::new(:pts)

  CurveShape = Struct::new(:point1, :point2, :point3, :point4)

  BezierShape = Struct::new(:controlPoint1, :controlPoint2, :endPoint)
end
