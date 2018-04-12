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

---

.geometry[
![Letter d tossed](image/d_toss.svg)]

---

.geometry[
![Letter d above flipped letter d](image/d_above.svg)]

---

.geometry[
![Letter d beside flipped letter d](image/d_beside.svg)]

---

.geometry[
![quartet of ds](image/d_quartet.svg)]

---

.geometry[
![nonet of ds](image/d_nonet.svg)]

---

.geometry[
![fish over double turned fish](image/fish_over.svg)]

---

.geometry[
![ttile of fish](image/fish_ttile.svg)]

---

.geometry[
![utile of fish](image/fish_utile.svg)]

---

.geometry[
![side_1 of fish](image/fish_side.svg)]

---

.geometry[
![corner_2 of fish](image/fish_corner.svg)]

---

.geometry[
![limit_2 of fish](image/fish_limit.svg)]

---

## Attributions

* Hand with reflecting sphere: [https://www.wikiart.org](https://www.wikiart.org/en/Search/hand%20with%20reflecting%20sphere)
* Grid Method: [https://www.art-is-fun.com](https://www.art-is-fun.com/grid-method)
* Escher in Elm: [https://github.com/einarwh/escher-workshop](https://github.com/einarwh/escher-workshop)
* Functional Geometry: [https://eprints.soton.ac.uk/257577/1/funcgeo2.pdf](https://eprints.soton.ac.uk/257577/1/funcgeo2.pdf)
