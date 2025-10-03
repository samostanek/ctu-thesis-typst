#let PAGE-MARGINS = (top: 3cm, bottom: 5cm, inside: 3.5cm, outside: 3.5cm)

#import "../utils.typ": *

#let page-header(digital: true) = context {
  // TODO: is this necessary?
  let current = getCurrentHeading(level: 1)

  // If there is no heading, don't write anything to the header.
  if current == none { return }

  // If this is an inserted page, don't write anything to the header.
  if is-page-inserted(here()) { return }

  // The heading counter at the location of the heading
  let heading-counter = counter(heading).at(current.location())

  // Align the header according to the printing rules
  let alignment = if digital { center } else if isPageEven() { start } else { end }
  set align(bottom + alignment)

  align(
    emph({
      numbering(
        if heading.numbering != none { heading.numbering } else { "1.1" },
        ..heading-counter,
      )
      h(0.5em)
      current.body
    }),
  )
}

#let page-footer(digital: true) = context {
  // If there is no numbering for the page, don't show it
  if here().page-numbering() == none { return }

  // If this is an inserted page, don't write anything to the footer.
  if is-page-inserted(here()) { return }

  // Align page numbering according to the printing rules
  let alignment = if digital { center } else if isPageEven() { start } else { end }
  set align(alignment)

  // Display the numbers using the specified page numbering
  let page-number = counter(page).get()
  align(alignment, emph(numbering(here().page-numbering(), ..page-number)))
}

#let set-page(digital: true, binding-offset: 1cm, doc) = {
  let printed-margins = (
    top: PAGE-MARGINS.top,
    bottom: PAGE-MARGINS.bottom,
    inside: PAGE-MARGINS.inside + (binding-offset / 2),
    outside: PAGE-MARGINS.outside - (binding-offset / 2),
  )

  // Account for binding for printed variants
  set page(margin: if digital { PAGE-MARGINS } else { printed-margins })
  set page(header-ascent: 40%, footer-descent: 20%)

  set page(header: page-header(digital: digital))
  set page(footer: page-footer(digital: digital))

  set footnote.entry(indent: 0em, gap: 1em)

  // Add pagebreak markers, so that headers and footers can be empty on inserted pages
  show pagebreak.where(to: "odd").or(pagebreak.where(to: "even")): it => {
    [#metadata[] <before-pagebreak-marker>]
    it
    [#metadata[] <after-pagebreak-marker>]
  }

  doc
}
