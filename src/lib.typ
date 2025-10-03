// TODO: font size for all headings and text (pay attention to the page/line register)
//    - this means revisit all font sizes
// TODO: default font?
//    - test some different fonts, bundle some of them with the template?
//    - font features? old-style / not old style numbers?
// TODO: generate documentation with tidy package
//    - document the existing code in the code, add external and internal documentation
// TODO: fix figures
//    - math environments use hidden figures for labeling, fix that?
// TODO: translate preamble pages
// TODO: all binding to the same side for oneside

#import "constants.typ": *

#import "styles/code.typ": set-code
#import "styles/figure.typ": set-figures
#import "styles/heading.typ": set-headings
#import "styles/list.typ": set-lists
#import "styles/math.typ": set-maths
#import "styles/page.typ": set-page
#import "styles/text.typ": set-text

// Reexport functions to the template user
#import "helpers.typ": *
#import "theorems.typ": *
#import "pages/lib.typ" as pages

/// The main template function.
///
/// ```typ
/// // Usage:
/// #show: fityper.with(
///   title: [My Awesome Thesis],
///   author: "Name Surname",
///   ..
/// )
/// ```
///
/// -> content
#let fiquill(
  /// The title of the thesis. Will be used in the PDF metadata.
  /// -> content
  title: [Your Thesis Title],
  /// Date of creation. Can be any content, will be put on the title page.
  ///
  /// If `auto`, then the current date (in english) is used.
  /// -> content | auto
  date: auto,
  /// The author of the thesis. Will be used in the PDF metadata.
  /// -> str
  author: "Name Surname",
  /// Keywords for the thesis. Will be used in the PDF metadata. Needs to be an array of strings.
  /// -> array
  keywords: (),
  /// A short description, visible only as the `subject` property in the PDF metadata.
  /// -> content | none
  description: none,
  /// Whether the document is prepared for digital, or printed usage.
  ///
  /// This affects properties like margins and the binding offset, alignment of page footers and headers, and similar.
  /// -> bool
  digital: true,
  /// Whether the document should use colors.
  ///
  /// This affects properties like link and reference coloring. When set to `false`, the document is black and white.
  /// When set to `auto`, inherits the `digital` value.
  /// -> bool | auto
  colored: auto,
  doc,
) = {
  if colored == auto {
    colored = digital
  }

  // Customize font sizes, paragraphs, links
  show: set-text.with(colored: colored)

  // Customize headings
  show: set-headings

  // Customize page margins, numbering, header and footer, etc.
  show: set-page.with(digital: digital)

  // Customize lists, enums, terms
  show: set-lists

  // Customize figures, tables, code listings
  show: set-figures

  // Customize math equations, numbering, theorem environments
  show: set-maths

  // Customize code
  show: set-code

  // Customize supplements.
  show figure.where(kind: table): set figure(supplement: translate-supplement("table"))
  show figure.where(kind: image): set figure(supplement: translate-supplement("image"))
  show figure.where(kind: raw): set figure(supplement: translate-supplement("listing"))
  set page(supplement: translate-supplement("page"))
  set heading(supplement: translate-supplement("heading"))
  set math.equation(supplement: translate-supplement("equation"))

  if date == auto {
    let current-datetime = datetime.today()
    date = current-datetime.display("[month repr:long] [year]")
  }

  // Specify metadata for processing
  [
    #metadata(title) <fityper-metadata-title>
    #metadata(date) <fityper-metadata-date>
    #metadata(author) <fityper-metadata-author>
    #metadata(keywords) <fityper-metadata-keywords>

    // Also specify internal metadata
    #metadata(digital) <fityper-metadata-digital>
  ]

  // Specify PDF metadata.
  set document(
    title: title,
    author: author,
    keywords: keywords,
    description: description,
  )

  doc
}

