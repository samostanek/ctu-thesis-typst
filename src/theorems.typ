#import "@preview/ctheorems:1.1.3": *
#import "constants.typ": *

#let theorem = thmplain(
  inset: 0pt,
  "theorem",
  translate-supplement("theorem"),
  titlefmt: smallcaps,
  separator: [. #h(0.5em)],
)

#let lemma = thmplain(
  inset: 0pt,
  "theorem",
  translate-supplement("lemma"),
  titlefmt: smallcaps,
  separator: [. #h(0.5em)],
)

#let proof = thmproof(
  inset: 0pt,
  "proof",
  translate-supplement("proof"),
  base: "theorem",
  separator: [. #h(0.5em)],
)

#let corollary = thmplain(
  inset: 0pt,
  "theorem",
  translate-supplement("corollary"),
  titlefmt: smallcaps,
  separator: [. #h(0.5em)],
)

#let remark = thmplain(
  inset: 0pt,
  "remark",
  translate-supplement("remark"),
  titlefmt: emph,
  separator: [. #h(0.5em)],
).with(numbering: none)
