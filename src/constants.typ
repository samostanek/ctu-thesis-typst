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

// Map faculty shortcuts to full names in different languages
#let faculty-names = (
  "FSv": (
    en: "Faculty of Civil Engineering",
    cz: "Fakulta stavební",
  ),
  "FS": (
    en: "Faculty of Mechanical Engineering",
    cz: "Fakulta strojní",
  ),
  "FEL": (
    en: "Faculty of Electrical Engineering",
    cz: "Fakulta elektrotechnická",
  ),
  "FJFI": (
    en: "Faculty of Nuclear Sciences and Physical Engineering",
    cz: "Fakulta jaderná a fyzikálně inženýrská",
  ),
  "FA": (
    en: "Faculty of Architecture",
    cz: "Fakulta architektury",
  ),
  "FD": (
    en: "Faculty of Transportation Sciences",
    cz: "Fakulta dopravní",
  ),
  "FBMI": (
    en: "Faculty of Biomedical Engineering",
    cz: "Fakulta biomedicínského inženýrství",
  ),
  "FIT": (
    en: "Faculty of Information Technology",
    cz: "Fakulta informačních technologií",
  ),
)

#let translate-faculty(shortcut) = context {
  if shortcut != none and shortcut in faculty-names {
    let lang = text.lang
    let faculty-lang = if lang == "cz" { "cz" } else { "en" }
    return smallcaps[#faculty-names.at(shortcut).at(faculty-lang)]
  }
}