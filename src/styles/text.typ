#let set-color(doc, colored: true) = {
  if colored {
    show link: set text(fill: color.hsl(204deg, 100%, 25%, 100%))
    show ref: set text(fill: color.hsl(204deg, 100%, 25%, 100%))
    doc
  } else {
    doc
  }
}

#let set-text(doc, colored: true) = {
  // Font sizes
  set text(size: 11pt)

  // Specify paragraph parameters
  set par(justify: true)
  set par(spacing: 0.85em, leading: 0.85em) // no additional space between paragraphs
  set par(first-line-indent: 1em) // identify new paragraphs with an indent

  show: set-color.with(colored: colored)

  doc
}
