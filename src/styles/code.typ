#let set-code(doc) = {
  import "@preview/codly:1.2.0": *
  import "@preview/codly-languages:0.1.1": *
  show: codly-init.with()
  codly(languages: codly-languages)
  codly(radius: 0pt, lang-format: none, zebra-fill: none, stroke: none)

  show raw: set text(font: "Latin Modern Mono 12", number-type: "lining")
  show raw.where(block: false): box.with(
    fill: luma(240),
    outset: (y: 2pt),
    inset: (x: 2pt),
    radius: 1pt,
  )


  doc
}
