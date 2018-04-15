# esche.rb
[Presentation][presentation] for the [Amsterdam.rb][] meetup of 17 April.

## Inspiration
This talk is heavily inspired by the excellent workshop [Escher in Elm][escher-in-elm] by the awesome [Einar Host][host]. His workshop in turn was based on the 1982 classic paper [functional geometry][funcgeo], or at least the revision from 2002.

## Summary
Be creating good [abstractions][abstraction] and relying on [function composition][wikipedia:function_composition] one is able to succinctly express pictures, like Eschers [Square Limit][square_limit].

![Square Limit, Escher 1964](https://uploads3.wikiart.org/images/m-c-escher/square-limit.jpg!Large.jpg)

## Dependencies
Below is an image of the dependencies between different files.

![Dependencies between different files](http://fifth-postulate.nl/esche.rb/image/dependencies.png)

## Development
### Presentation
The presentation is defined in the Markdown file `functional_geometry.md` in the
`docs` directory. 

To view the presentation got to the `docs` directory and run a HTTP server

```shell
python -m SimpleHTTPServer
```

Open [localhost:8000](http://localhost:8000).

### Picture
To create a picture describe it in `escher.rb` and run

```shell
ruby escher.rb > ../image/<INSERT NAME>.svg
```

To show a box, do the same, but in `show_box.rb`, running

```shell
ruby show_box.rb > ../image<INSERT NAME>.svg
```

[presentation]: http://fifth-postulate.nl/esche.rb/
[Amsterdam.rb]: http://amsrb.org/
[escher-in-elm]: https://github.com/einarwh/escher-workshop
[host]: https://einarwh.wordpress.com/
[funcgeo]: https://eprints.soton.ac.uk/257577/1/funcgeo2.pdf
[abstraction]: https://en.wikipedia.org/wiki/Abstraction
[wikipedia:function_composition]: https://en.wikipedia.org/wiki/Function_composition
[square_limit]: https://www.wikiart.org/en/m-c-escher/square-limit
