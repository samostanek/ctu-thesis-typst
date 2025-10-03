#let set-lists(doc) = {
  show selector(list).or(enum).or(terms): it => {
    // TODO: This sets the paragraph settings to default, maybe it would be nice to customize them
    // Considering that we do customize the paragraph spacings
    set par(spacing: 1.2em, leading: 0.65em)
    it
  }

  doc
}
