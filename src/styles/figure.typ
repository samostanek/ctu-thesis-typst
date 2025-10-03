#import "../utils.typ": *

#import "@preview/i-figured:0.2.4": show-figure

// #let add

#let set-figures(doc) = {
  // Add some spacing around figures
  show figure: set block(above: 2em, below: 2em)
  show figure: show-figure.with(numbering: "1.1")

  // Customize tables
  set table(inset: 0.4em)
  set table(stroke: 0pt)
  set table.hline(stroke: 0.8pt)
  show figure.where(kind: table): set figure.caption(position: top)

  doc
}
