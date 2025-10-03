#import "@preview/i-figured:0.2.4": reset-counters
#import "../utils.typ": binding-pagebreak

#let set-headings(doc) = {
  // Custom heading function (different number size)
  show heading: it => {
    let text-size = 1em.to-absolute()
    let number-size = text-size * if it.level == 1 { 2 } else { 1 }

    block({
      if (it.numbering != none) {
        set text(number-size)
        counter(heading).display(it.numbering)
        h(0.5em)
      }

      set text(text-size)
      it.body
    })
  }

  // Heading sizes.
  // Everything else is the same as font size.
  show heading.where(level: 1): set text(size: 20pt)
  show heading.where(level: 2): set text(size: 16pt)
  show heading.where(level: 3): set text(size: 13pt)

  // Heading spacing.
  // TODO: Everything else is (for now) 1.44em/0.75em
  show heading.where(level: 1): set block(above: 40pt, below: 30pt)
  show heading.where(level: 2): set block(above: 32pt, below: 16pt)
  show heading.where(level: 3): set block(above: 26pt, below: 13pt)

  // Standard heading numbering in academia
  set heading(numbering: "1.1")

  // Headings use smallcaps, not bold
  show heading: smallcaps
  show heading: set text(weight: "regular")

  // Headings do not use hyphenation
  show heading: set text(hyphenate: false)

  // Each level 1 heading starts on a new odd page.
  show heading.where(level: 1): it => [#binding-pagebreak() #it]

  // Each level 1 heading resets the counters.
  show heading.where(level: 1): it => [#counter(footnote).update(0) #it]
  show heading: reset-counters

  doc
}
