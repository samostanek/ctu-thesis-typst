#import "@preview/i-figured:0.2.4": show-figure
#import "../utils.typ": optical-lines, binding-pagebreak

#let namedblock(
  name: "Block Heading",
  headingsize: 24pt,
  content,
) = {
  context block[
    #text(headingsize, smallcaps(name))

    #content
  ]
}

/// Inserts a title page.
/// -> content
#let title(
  /// Institution under which the thesis is published.
  ///
  /// If `auto`, then a default for FI MUNI is used.
  /// -> content | auto
  institution: auto,
  /// Logo of the institution under which the thesis is published.
  ///
  /// If `auto`, then a default for FI MUNI is used.
  /// -> content | auto
  logo: auto,
  /// Title of the thesis.
  ///
  /// If `auto`, then the provided template metadata is used.
  /// -> content | auto
  title: auto,
  /// Thesis type shown before the author.
  ///
  /// If `auto`, then the default of `[Bachelor's Thesis]` is used.
  /// -> content | auto
  thesis: auto,
  /// Author of the thesis.
  ///
  /// If `auto`, then the provided template metadata is used.
  /// -> content | auto
  author: auto,
  /// Date to be shown on the title page.
  ///
  /// If `auto`, then the provided template metadata is used.
  /// -> content | auto
  date: auto,
) = {
  if title == auto {
    title = context query(<fityper-metadata-title>).first().value
  }

  if author == auto {
    author = context query(<fityper-metadata-author>).first().value
  }

  if date == auto {
    date = context query(<fityper-metadata-date>).first().value
  }

  if institution == auto {
    institution = [
      #text(15pt, smallcaps[Masaryk University]) \
      #text(13pt, smallcaps[Faculty of Informatics])
    ]
  }

  if logo == auto {
    logo = [
      #image("../../assets/fi_znak-cb.svg", width: 50mm, height: 50mm)
    ]
  }

  if thesis == auto {
    thesis = [Bachelor's Thesis]
  }

  set text(hyphenate: false)
  binding-pagebreak(preamble: true)
  page[
    #align(center)[
      #v(10%)
      #institution
      #v(5%)
      #logo

      #v(1fr)

      #text(24pt, smallcaps(title))
      #v(5%)
      #text(16pt, smallcaps(thesis)) \
      #text(16pt, emph(author))

      #v(1fr)

      #text(13pt, smallcaps(date))
    ]
  ]
}


// TODO: find a way to reuse the author from titlepage
/// Inserts a declaration page.
/// -> content
#let declaration(
  /// Author of the declaration.
  ///
  /// If `auto`, then the provided thesis author is used.
  /// -> content | auto
  author: auto,
  /// Content to be put in the page's header.
  /// -> content | none
  header: none,
  /// Content to be put in the page's footer.
  ///
  /// If `auto`, shows the page's numbering (if enabled).
  /// -> content | auto | none
  footer: auto,
  /// Content to be put at the bottom of the page.
  /// -> content | none
  additional-content: none,
  /// The content of the declaration page.
  /// -> content
  content,
) = {
  if author == auto {
    author = context query(<fityper-metadata-author>).first().value
  }

  binding-pagebreak(preamble: true)
  context page(header: header, footer: footer)[
    #set par(first-line-indent: 0pt, spacing: par.leading * 2)

    #v(25%)
    #namedblock(name: "Declaration", content)
    #align(end, emph(author))

    #v(1fr)
    #additional-content
  ]
}

/// Inserts an acknowledgement page.
/// -> content
#let acknowledgements(
  /// Content to be put in the page's header.
  /// -> content | none
  header: none,
  /// Content to be put in the page's footer.
  ///
  /// If `auto`, shows the page's numbering (if enabled).
  /// -> content | auto | none
  footer: auto,
  /// Content to be put at the bottom of the page.
  /// -> content | none
  additional-content: none,
  /// The content of the acknowledgements page.
  /// -> content
  content,
) = {
  binding-pagebreak(preamble: true)
  context page(header: header, footer: footer)[
    #set par(first-line-indent: 0pt, spacing: par.leading * 2)

    #v(25%)
    #namedblock(name: "Acknowledgements", content)

    #v(1fr)
    #additional-content
  ]
}

/// Generates a content block that shows thesis keywords. Does *not* generate a page.
/// -> content
#let keywords(
  /// The keywords for the thesis.
  ///
  /// If `auto`, then the provided metadata is used.
  /// -> content | auto
  keywords: auto,
) = {
  if keywords == auto {
    keywords = context query(<fityper-metadata-keywords>).first().value.join(", ")
  }

  [
    #text(16pt, smallcaps("Keywords")) \
    #smallcaps(keywords)
  ]
}

/// Inserts an abstract page.
/// -> content
#let abstract(
  /// Content to be put in the page's header.
  /// -> content | none
  header: none,
  /// Content to be put in the page's footer.
  ///
  /// If `auto`, shows the page's numbering (if enabled).
  /// -> content | auto | none
  footer: auto,
  /// Content to be put at the bottom of the page.
  /// -> content | none
  additional-content: none,
  /// The content of the abstract.
  /// -> content
  content,
) = {
  if keywords == auto {
    keywords = context query(<fityper-metadata-keywords>).first().value.join(", ")
  }

  binding-pagebreak(preamble: true)
  context page(header: header, footer: footer)[
    #set par(first-line-indent: 0pt, spacing: par.leading * 2)

    #v(25%)
    #namedblock(name: "Abstract", content)

    #v(1fr)
    #additional-content
  ]
}

#let built-in-outline = outline

/// Inserts an outline page.
/// -> content
#let outline(
  /// The target of the outline. Can be any valid selector, check #underline[#text(blue)[#link("https://typst.app/docs/reference/model/outline/#parameters-target")[the documentation]]].
  /// -> label | selector | location | function
  target: heading,
  /// The text that is displayed as the outline header.
  headingtext: [Contents],
) = {
  binding-pagebreak(preamble: true)

  // A little bit less tight spacing
  set par(leading: 1em)

  // replace the heading in the content with a custom one
  set built-in-outline(title: none)
  show built-in-outline: it => {
    show heading: it => text(24pt, smallcaps(it.body))
    text(24pt, smallcaps(headingtext))
    v(2em)
    it
  }

  // replace the dots with dots spaced further apart
  set built-in-outline.entry(fill: [#h(0.5em) #box(repeat([.], gap: 0.5em), width: 1fr) #h(1em)])

  // for level 1 headings, do not show any fill
  show built-in-outline.entry.where(level: 1): set built-in-outline.entry(fill: [])

  // render the outline
  page[
    #built-in-outline(target: target)
  ]
}

/// Resets the page number, enables page numbering, starts content on a new page.
/// Use this function as a show rule after all preamble pages.
/// -> content
#let start-content(
  /// The page to skip to.
  /// -> "even" | "odd" | none
  to: "odd",
  /// The numbering that applies for the rest of the document.
  /// -> function | none | str
  numbering: "1",
  doc,
) = {
  pagebreak(to: to, weak: true)
  counter(page).update(1)
  set page(numbering: numbering)
  doc
}

/// Resets the heading number and starts numbering headings and figures differently.
/// Use this function as a show rule after the main body of the thesis.
/// -> content
#let start-appendices(
  /// The page to skip to.
  /// -> "even" | "odd" | none
  to: "odd",
  /// The numbering that applies for the rest of the document.
  /// -> function | none | str
  numbering: "A.1",
  doc,
) = {
  pagebreak(to: to, weak: true)
  counter(heading).update(0)
  set heading(numbering: numbering)
  show figure: show-figure.with(numbering: numbering)
  doc
}
