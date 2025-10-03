#let set-maths(doc) = {
  set math.equation(numbering: "(1.1)")

  // This is required for the math environments from `math.typ` to work.
  import "@preview/ctheorems:1.1.3": *
  show: thmrules

  // Allows for nicer numbering and alignment
  import "@preview/equate:0.3.1": equate
  show: equate.with(sub-numbering: true)

  doc
}
