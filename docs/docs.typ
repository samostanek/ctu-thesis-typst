#import "@preview/tidy:0.4.2"
#let docs = tidy.parse-module(read("/src/lib.typ"))
#tidy.show-module(docs, style: tidy.styles.default)

#pagebreak(weak: true)

#let docs = tidy.parse-module(read("/src/pages/pages.typ"))
#tidy.show-module(docs, style: tidy.styles.default)

#pagebreak(weak: true)

#let docs = tidy.parse-module(read("/src/theorems.typ"))
#tidy.show-module(docs, style: tidy.styles.default)

#pagebreak(weak: true)

#let docs = tidy.parse-module(read("/src/helpers.typ"))
#tidy.show-module(docs, style: tidy.styles.default)
