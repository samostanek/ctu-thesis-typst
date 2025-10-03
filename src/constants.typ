#let authorship-declaration = [
  Hereby I declare that this thesis is my original authorial work, which I have worked out on my own. All sources, references, and literature used or excerpted during elaboration of this work are properly cited and listed in complete reference to the due source.
]

// TODO: specify different supplements for different kinds of headings
// TODO: update slovak and czech supplements
#let supplements = (
  "en": (
    table: [Table],
    image: [Figure],
    listing: [Listing],
    page: [page],
    heading: [Section],
    equation: [Equation],
    theorem: [Theorem],
    lemma: [Lemma],
    proof: [Proof],
    corollary: [Corollary],
    remark: [Remark],
  ),
  "sk": (
    table: [Tabuľka],
    image: [Obrázok],
    listing: [Kód],
    page: [strana],
    heading: [Sekcia],
    equation: [Rovnica],
    theorem: [Teorém],
    lemma: [Lemma],
    proof: [Dôkaz],
    corollary: [Dôsledok],
    remark: [Poznámka],
  ),
  "cz": (
    table: [Tabulka],
    image: [Obrázek],
    listing: [Kód],
    page: [strana],
    heading: [Sekce],
    equation: [Rovnice],
    theorem: [Věta],
    lemma: [Lemma],
    proof: [Důkaz],
    corollary: [Důsledek],
    remark: [Poznámka],
  ),
)

// TODO: this might be useful for not only supplements
#let translate-supplement(id) = context {
  if (text.lang in supplements) {
    return supplements.at(text.lang).at(id)
  } else {
    return supplements.at("en").at(id)
  }
}
