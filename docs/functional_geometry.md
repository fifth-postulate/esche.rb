# Esche.rb
## Amsterdam.rb
## 17 April

---

![Hand with reflecting sphere; Escher](image/hand-with-reflecting-sphere.jpg)

???

* Maurits Cornelis Escher
* 17 June 1898 – 27 March 1972

---

![Square Limit; Escher](image/square-limit.jpg)

???

* Square Limit
* 1964

---

![Grid Method](image/grid-method.jpg)

???

* Grid Method
* Transform Grid

---

.geometry[
![a box](image/box.svg)]

--

```ruby
Box = Struct.new(:a, :b, :c)
```

---

.geometry[
![Letter d](image/d.svg)]

???

* No symmetries. d, b, p, q all different

---

.geometry[
![Letter d turned](image/d_turn.svg)]

???

* Turn

---

.geometry[
![a box turned](image/box_turn.svg)]

.small.geometry[
![A reference box](image/box.small.svg)]

???

* Turn the box
* How?

--

```ruby
def turn_box(box)
  Box.new(
    add(box.a, box.b),
    box.c,
    neg(box.b)
  )
end
```

---

.geometry[
![Letter d flipped](image/d_flip.svg)]

???

* Flip

---

.geometry[
![a box flipped](image/box_flip.svg)]

.small.geometry[
![A reference box](image/box.small.svg)]


???

* Flip the box
* How?

--

```ruby
def flip_box(box)
  Box.new(
    add(box.a, box.b),
    neg(box.b),
    box.c
  )
end
```

---

.geometry[
![Letter d tossed](image/d_toss.svg)]

???

* Toss

---

.geometry[
![a box tossed](image/box_toss.svg)]

.small.geometry[
![A reference box](image/box.small.svg)]

???

* Toss the box
* How?

--

```ruby
def toss_box(box)
  Box.new(
    add(box.a, scale(0.5, add(box.b, box.c))),
    scale(0.5, add(box.b, box.c)),
    scale(0.5, sub(box.c, box.b))
  )
end
```

---

.geometry[
![Letter d above flipped letter d](image/d_above.svg)]

---

.geometry[
![stacked boxes](image/box_split_vertically.svg)]

.small.geometry[
![A reference box](image/box.small.svg)]

---

.geometry[
![stacked boxes](image/box_scaled.svg)]

.small.geometry[
![A reference box](image/box.small.svg)]


---

.geometry[
![stacked boxes](image/box_moved_scaled.svg)]

.small.geometry[
![A reference box](image/box.small.svg)]

---

.geometry[
![stacked boxes](image/box_split_vertically.02.svg)]

.small.geometry[
![A reference box](image/box.small.svg)]

---

.geometry[
![Letter d above flipped letter d](image/d_above.02.svg)]

--

```elm
Picture : Box -> List Shape
```

???

* Little white lie
* Picture : Box -> List (Shape, Style)

---

```ruby
def above_ratio(m, n, pm, pn)
  lambda { |box|
    factor = m.to_f() / (m + n).to_f()
    boxm, boxn = split_vertically(factor, box)
    pm.(boxm) + pn.(boxn)
  }
end
```

---

.geometry[
![Letter d beside flipped letter d](image/d_beside.svg)]

--

```ruby
def beside (pm, pn)
  beside_ratio(1, 1, pm, pn)
end
```

---

.geometry[
![quartet of ds](image/d_quartet.svg)]

--

```ruby
def quartet(nw, ne, sw, se)
  above(beside(nw, ne), beside(sw, se))
end
```

---

.geometry[
![nonet of ds](image/d_nonet.svg)]


---

```ruby
def row(w, m, e)
  beside_ratio(1, 2, w, beside(m, e))
end

def column(n, m, s)
  above_ratio(1, 2, n, above(m, s))
end

def nonet(nw, nm, ne, mw, mm, me, sw, sm, se)
  column(row(nw, nm, ne), row(mw, mm, me), row(sw, sm, se))
end
```

---

![How to draw an owl?](image/owl.jpg)

---

.geometry[
![Escher's fish](image/fish.svg)]

---

.geometry[
![fish over double turned fish](image/fish_over.svg)]

--

```ruby

def over(p, q)
  lambda { |box|
    p.(box) + q.(box)
  }
end
```

???

* Remember `Picture : Box -> List Shape`


---

.geometry[
![ttile of fish](image/fish_ttile.svg)]

--

```ruby
def ttile(p)
  f = flip(toss(p))
  over(p, over(f,turn(turn(turn(f)))))
end
```

---

.geometry[
![utile of fish](image/fish_utile.svg)]

--

```ruby
def utile(p)
  f = flip(toss(p))
  g = over(f, turn(f))
  over(g, turn(turn(g)))
end
```

---

.geometry[
![side_1 of fish](image/fish_side.svg)]

---

.geometry[
![side_2 of fish](image/fish_side.02.svg)]

---

.geometry[
![side_2 of fish with grid](image/fish_side.grid.svg)]

---

```ruby
def side(n, p)
  if n == 0 then
    blank()
  else
    se = ttile(p)
    sw = turn(se)
    ne = side(n - 1, p)
    nw = ne

    quartet(nw, ne, sw, se)
  end
end
```

---

.geometry[
![corner_2 of fish](image/fish_corner.svg)]

---

.geometry[
![corner_2 of fish](image/fish_corner.grid.svg)]

---

```ruby
def corner(n, p)
  if n == 0 then
    blank()
  else
    nw = corner(n - 1, p)
    ne = side(n - 1, p)
    sw = turn(ne)
    se = utile(p)

    quartet(nw, ne, sw, se)
  end
end
```

---

.geometry[
![limit_4 of fish](image/fish_limit.svg)]

---

```ruby
def square_limit(n, p)
  if n == 0 then
    blank()
  else
    nm = side(n - 1, p)
    mw = turn(nm)
    sm = turn(mw)
    me = turn(sm)

    nw = corner(n - 1, p)
    sw = turn(nw)
    se = turn(sw)
    ne = turn(se)

    mm = utile(p)

    nonet(nw, nm, ne, mw, mm, me, sw, sm, se)
  end
end
```

---

## Attributions

* Hand with reflecting sphere: [https://www.wikiart.org](https://www.wikiart.org/en/Search/hand%20with%20reflecting%20sphere)
* Grid Method: [https://www.art-is-fun.com](https://www.art-is-fun.com/grid-method)
* Escher in Elm: [https://github.com/einarwh/escher-workshop](https://github.com/einarwh/escher-workshop)
* Functional Geometry: [https://eprints.soton.ac.uk/257577/1/funcgeo2.pdf](https://eprints.soton.ac.uk/257577/1/funcgeo2.pdf)
* Code and Presentation: [https://github.com/fifth-postulate/esche.rb](https://github.com/fifth-postulate/esche.rb)
