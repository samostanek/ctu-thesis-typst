#let isPageEven() = calc.even(counter(page).get().first())
#let getCurrentHeading(level: int) = {
  let heading-selector = selector(heading.where(level: level))

  let headings = query(heading-selector.before(here()))
  if headings.len() < 1 { return none }

  let next-headings = query(heading-selector.after(here()))
  if next-headings.len() > 0 {
    let next-heading = next-headings.first()
    // TODO: this logic does not belong here
    if next-heading.location().page() == here().page() {
      if (level == 1) {
        return none
      } else {
        return next-heading
      }
    }
  }

  return headings.last()
}

#let optical-lines = {
  place(top, line(start: (50%, 0%), end: (100%, 100%)))
  place(top, line(start: (50%, 0%), end: (0%, 100%)))
  place(top, line(start: (0%, 0%), end: (100%, 100%)))
  place(top, line(start: (100%, 0%), end: (0%, 100%)))
}

#let is-page-inserted(loc) = {
  let before-pagebreak-markers = query(selector(<before-pagebreak-marker>).before(loc))
  let after-pagebreak-markers = query(selector(<after-pagebreak-marker>).before(loc))

  if before-pagebreak-markers.len() > 0 {
    if before-pagebreak-markers.last().location().page() == loc.page() {
      return false
    }
  }

  return before-pagebreak-markers.len() > after-pagebreak-markers.len()
}

#let binding-pagebreak(preamble: false) = context {
  let is-digital = query(<fityper-metadata-digital>).first().value
  if is-digital {
    if not preamble {
      pagebreak(weak: true)
    }
  } else {
    pagebreak(to: "odd", weak: true)
  }
}
