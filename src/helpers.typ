#import "@preview/i-figured:0.2.4": _prefix

/// Create a selector that targets figures of specific kind in the document. Useful for creating custom figure outlines.
/// -> selector | none
#let figure-selector(
  /// What kinds to use in the selector. Must be an array of kinds used in figures.
  ///
  /// If `auto`, then the default of `(raw, table, image)` is used.
  /// -> array | auto
  kinds: auto,
) = {
  if kinds == auto {
    kinds = (raw, table, image)
  }

  let selectors = kinds.map(kind => selector(figure.where(kind: _prefix + repr(kind))))
  return selectors.reduce((acc, sel) => acc.or(sel))
}
