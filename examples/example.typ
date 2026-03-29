#import "@preview/lovelace:0.3.0": *
#import "@preview/codly:1.2.0": *

#import "../src/lib.typ": *

#set text(lang: "en")

// Use and setup the template
#show: ctu-thesis-template.with(
  faculty: "FJFI",
  department: "Department of Physics",
  title: [Typesetting Typst Thesis Template],
  date: [March 2025],
  author: "Author Name",
  supervisor: "Ing. Supervisor Name, Ph.D., Department of Something",
  consultant: "Ing. Consultant Name, Ph.D., Department of Something",
  keywords: ("some", "keywords", "DNA", "Typst"),
  description: [Specify short description here to set PDF metadata],
  digital: true,
  colored: auto,
)

#pages.title()

// === ZADÁNÍ práce ===
// You can uncomment this section to include the assignment and declaration pages
// #[
// #set page(margin: 0pt)
// #image("assets/assignment.pdf")
// #image("assets/declaration.pdf")
// ]

// === ABSTRACT in English ===
#pages.abstract(additional-content: pages.keywords())[
  #lorem(50)

  Yes, that _is_ another paragraph. What are you going to do about it?

  #lorem(100)
]

// === ABSTRAKT v češtině ===
#pages.abstract(additional-content: pages.keywords(keywords: "klíčová, slova, DNA, Typst"))[
  #lorem(50)

  Ano, to _je_ další odstavec. Co s tím uděláš?

  #lorem(100)
]

#pages.outline()

#pages.acknowledgements(footer: [_Look on my Works, ye Mighty, and despair!_])[
  I would like to thank everyone's mother and their dog in writing this thesis. #lorem(50)
]

#let figureselector = (
  figure
    .where(kind: raw) // specify figure selectors
    .or(selector(figure.where(kind: table)))
    .or(selector(figure.where(kind: image)))
)

#pages.outline(target: figureselector, headingtext: [Figures])

#show: pages.start-content

= First heading
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam faucibus eros eu ex ultrices sollicitudin. Duis nec massa vitae ante efficitur condimentum. Ut interdum odio sit amet massa mattis scelerisque. Vivamus auctor hendrerit augue, eget lobortis metus. Nulla volutpat ornare blandit. Maecenas fermentum nunc quis sagittis eleifend. Phasellus tempor diam eu risus eleifend, eget gravida lectus vestibulum. Donec sodales elit vel ex varius, nec placerat dui vulputate. Pellentesque vitae molestie risus, id blandit dolor. Maecenas gravida semper lobortis. Maecenas egestas arcu id ante posuere aliquet. Sed eleifend non justo ut egestas. Etiam fermentum massa diam, sit amet ornare mi eleifend vulputate. Phasellus at aliquet tellus. Donec malesuada ut lorem quis dictum. Donec fringilla nunc ac justo bibendum auctor.

== Yeah, why?
Mauris in fermentum eros#footnote[Greek god of love, desire, and sexual attraction]. Sed vel varius libero, mollis faucibus urna. Nam ac consequat orci, vitae varius erat. Donec tempor diam eu diam sollicitudin, eget vulputate nulla varius. Vivamus consequat est orci, non mollis nisi mattis et. Nunc magna orci, efficitur eu dapibus eget, pulvinar a sapien. Nam porttitor volutpat ex et vestibulum. Morbi#footnote[#emoji.skull] nisl urna, venenatis vel dolor ac, semper bibendum dui.

=== Level 3
Aliquam rhoncus faucibus ipsum vel scelerisque. In sodales ex in metus ornare, vitae eleifend libero ultrices. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut quis auctor mauris. Vivamus erat diam, lacinia at purus a, aliquet tempus nibh. Sed condimentum purus id maximus placerat. Nunc vitae eleifend tortor, a sagittis lectus. Nunc molestie imperdiet mollis. Sed ultricies, quam et blandit feugiat, tellus metus venenatis nunc, in porttitor nunc nunc in sapien.

== Another subheading
Morbi vel elit vehicula, pretium nunc nec, consectetur justo. Donec hendrerit ornare lobortis. Nulla congue ut arcu et pulvinar. Fusce viverra aliquam molestie. Fusce cursus sodales pharetra. Suspendisse non lacinia leo. Integer risus sapien, egestas bibendum lectus ac, luctus condimentum nisl. Duis cursus justo enim, sit amet venenatis dui finibus sed. Maecenas vestibulum sem sed purus lacinia rhoncus. Morbi ac ultricies lectus. Nunc nunc quam, malesuada in nisi eget, rhoncus lacinia ante.

=== Level 3 2
Nullam a scelerisque diam. Vivamus luctus turpis massa, vitae dictum libero vulputate vel. Vestibulum ac lobortis arcu. Integer auctor est tellus, et ullamcorper lorem maximus#footnote[A well known Harry Potter spell] nec. Nullam et ipsum nulla. Vivamus aliquam gravida nulla. Proin velit massa, gravida ac leo quis, mollis pharetra risus. Nunc nec massa eu nisi hendrerit pulvinar vel id arcu. Proin sem quam, ultricies laoreet laoreet a, ullamcorper ut metus. Etiam sed commodo lorem. Ut efficitur enim sollicitudin tellus egestas, at scelerisque arcu imperdiet. Nunc eu luctus urna. Mauris facilisis lacus nec imperdiet finibus. Donec eu vulputate magna.

=== Level 3 3
Mauris commodo porta suscipit. Suspendisse potenti. Nunc ornare elit eu faucibus posuere. Vestibulum sit amet arcu vestibulum, molestie turpis id, congue justo. Curabitur ut suscipit eros, non placerat nisl. Donec molestie malesuada nunc, eget maximus est aliquam nec. Phasellus et est tellus.

Vestibulum a magna id leo commodo blandit. Nam viverra rutrum accumsan. Curabitur pretium, nisl et mollis aliquet, velit metus gravida nisi, tincidunt aliquam ex leo at augue. Integer laoreet at augue ac blandit. Pellentesque nibh eros, iaculis id neque eu, tempus porttitor metus. Maecenas leo arcu, feugiat in fringilla sit amet, pretium at nulla. Vivamus et tristique elit. Pellentesque dignissim lacinia semper.

Mauris a luctus elit. Maecenas rhoncus quam eu nunc volutpat, eu porta purus tristique. Quisque dignissim ante sed metus varius lobortis sit amet sed ipsum. Aliquam cursus pellentesque elementum. Fusce eget nulla ac magna pulvinar posuere at rhoncus nisl. Aenean consequat velit sed tempor rutrum. Proin auctor feugiat velit nec pretium. Sed fringilla vel lectus a consequat. Integer convallis a leo ac aliquet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.

= Second heading <linklabel>
Fusce blandit mi eget rutrum vestibulum. Nulla#footnote[this footnote should have been reset] in cursus ligula. In hac habitasse platea dictumst. Nullam non porta leo. Nulla euismod ligula id turpis interdum, et ultricies felis tincidunt. Vestibulum aliquam elit mauris, nec eleifend ipsum fermentum a. Praesent nec aliquam nisl. Sed sit amet est molestie, mollis mauris in, pretium est.

== Some more headings (first)
Nam semper dictum justo eu commodo. Sed blandit ex pretium ipsum accumsan, in facilisis augue faucibus. Sed rutrum magna metus. Fusce sollicitudin magna in laoreet maximus. Suspendisse potenti. Nunc vel velit elit. Nullam enim felis, vulputate quis nulla eget, imperdiet tincidunt sem. Integer vulputate blandit justo sed cursus. Proin aliquet ante sapien, ac posuere lacus congue in. Proin in hendrerit magna, vel ultricies nulla.

=== Banana
Mauris et leo eleifend, condimentum elit quis, hendrerit odio. Cras vel laoreet lectus. Maecenas vel nulla a felis consequat rutrum. Donec mattis neque nec neque commodo, eget posuere eros faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec gravida lacinia sem eu aliquet. Praesent a pharetra ex. Nam non dui aliquam, scelerisque nisl eu, pretium risus. Nunc malesuada gravida nunc.

=== Apple
In mattis orci id mauris ultrices mattis. Proin iaculis tortor quis turpis dictum hendrerit. Curabitur gravida arcu sed neque malesuada, nec hendrerit enim imperdiet. Cras et dictum quam. Phasellus euismod ex et leo feugiat, sed blandit turpis posuere. Vestibulum lobortis nibh nec sodales bibendum. Sed fringilla purus sed dictum tincidunt. Aliquam dui metus, porta vitae molestie ut, iaculis sit amet enim.

Donec porttitor diam vel nulla ornare faucibus. Vestibulum ultricies diam non volutpat tincidunt. Vestibulum sapien ante, gravida in iaculis eu, auctor a leo. Quisque eu hendrerit magna. Sed urna tellus, sollicitudin sit amet feugiat id, maximus sit amet dui. Fusce id purus magna. Nunc tristique risus vitae justo fringilla facilisis.

== Some more headings (second)
Curabitur leo purus, scelerisque quis elit nec, accumsan dictum lorem. Vestibulum efficitur mauris elit, vel pretium arcu cursus ut. Aenean quis rhoncus mi, in bibendum est. Sed pharetra lacus felis, sit amet rutrum velit posuere sit amet. Pellentesque eu purus sit amet libero viverra dapibus. Nam lectus eros, ultrices quis semper eu, aliquet sed elit. Morbi sit amet tellus at lacus accumsan lacinia a non magna. Vivamus bibendum interdum quam, eget suscipit ex sagittis sit amet. Pellentesque eleifend at nulla sit amet hendrerit. In ultricies vitae felis vehicula maximus. Nunc consequat leo eu faucibus mattis. Maecenas tortor dolor, hendrerit in arcu vel, sodales blandit velit. Fusce eget aliquet sapien, eu bibendum nisl.

=== Coconut
Etiam scelerisque ultrices sem sollicitudin cursus. Etiam vitae metus in ipsum porta malesuada in et nibh. Nam bibendum dapibus quam in interdum. Cras sit amet viverra sem. Duis vel nibh eu erat rutrum bibendum ornare id quam. Phasellus at luctus dolor. Aenean eget blandit enim. Vivamus diam metus, dignissim non metus et, consequat vehicula lectus. Fusce porta sapien a pulvinar rutrum. Nam in ligula sed ante venenatis feugiat eget vitae mi. Nullam euismod elit molestie aliquet pulvinar. Donec eu aliquet felis. Pellentesque in turpis ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;

Nunc vel felis rhoncus ex maximus fringilla eget vitae massa. Quisque rhoncus nisl at tellus imperdiet hendrerit. Nunc risus purus, imperdiet sit amet lorem euismod, vulputate commodo felis. Donec commodo nisi ligula, ac auctor nisl venenatis eu. Phasellus semper ex sem, vitae scelerisque lectus mollis at. Phasellus egestas, lorem sed scelerisque efficitur, urna orci rutrum lacus, at hendrerit arcu tortor quis sem. Suspendisse a odio turpis. Pellentesque pretium ligula sapien, vel lobortis orci tempus in. Ut neque turpis, dapibus ac lectus et, dapibus lacinia massa. Aenean quis viverra velit, id mollis ex.

== Even more headings
Vestibulum vel tellus ut dui vulputate aliquam faucibus in metus. Quisque a dictum tellus, quis sagittis elit. Suspendisse fringilla, nisl ac mollis commodo, libero tortor semper metus, at faucibus magna lacus vitae nisi. Sed rutrum urna quam, id vestibulum mauris fermentum ac. Duis aliquam dignissim pulvinar. Morbi eget cursus lorem. Cras sed vehicula purus, eget egestas eros. Praesent posuere, nisi non tincidunt vehicula, dui mauris gravida arcu, commodo pharetra libero erat at felis. Morbi pharetra sodales erat, et lobortis est cursus ac. Etiam neque nulla, semper eu quam ac, efficitur commodo risus. Duis arcu ipsum, consectetur nec est vitae, varius fringilla quam. Donec lobortis quam non iaculis laoreet. Sed sollicitudin nisi egestas convallis cursus. Vestibulum blandit lorem lacus, in ultricies odio pretium non. Mauris iaculis, nisl ut malesuada hendrerit, turpis lorem cursus orci, sed auctor ligula felis aliquam leo. Quisque molestie placerat arcu, sit amet faucibus ex interdum porta.


= Latex vs Typst
Pellentesque placerat purus et purus hendrerit tristique. Aliquam pretium dignissim dui. Aliquam ultrices viverra fringilla. Vivamus lacus risus, maximus id neque vitae, lobortis elementum tellus. Etiam sed nibh interdum, scelerisque sem vehicula, molestie justo. Nullam sit amet consectetur ipsum. Etiam iaculis justo non ipsum aliquam, at ornare augue facilisis. Fusce efficitur tempor nunc non sodales.

#page()[
  #footnote[This page has 1800 characters, or one standard page]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu luctus lectus. Fusce dictum purus sit amet felis commodo fringilla. Maecenas id lobortis nisi. Nullam vel neque ex. Ut non purus pellentesque, convallis lectus id, scelerisque ex. Curabitur dignissim ante ac lacinia gravida. Phasellus dictum enim a nisl tempor, nec laoreet ipsum imperdiet. Donec ac sollicitudin magna. Nullam faucibus tellus eros, at auctor ipsum sagittis dapibus. Nullam scelerisque justo at aliquam hendrerit.

  Aenean convallis velit ligula, in eleifend mi tincidunt a. In aliquam nisi felis, non mollis arcu ultrices eu. Nulla pharetra dolor ac justo bibendum varius. Integer eget ipsum nec tortor congue semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vulputate velit id dolor tincidunt ornare. Pellentesque pellentesque arcu finibus arcu rutrum, quis vehicula tellus mollis. Phasellus sed elit sollicitudin, sollicitudin velit vitae, condimentum ante. Vivamus molestie odio ut nisi commodo rutrum. Nulla facilisi. Integer eros felis, malesuada non enim eget, cursus ullamcorper nisl.

  Praesent convallis, mi et porta ornare, purus nunc accumsan lacus, ut elementum enim enim nec ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel semper ex. Proin efficitur aliquet nisi quis lacinia. Morbi vestibulum mauris eu arcu tempor, at pellentesque turpis tristique. Quisque tristique lorem ipsum, vel sodales purus luctus sed. Aenean hendrerit nisi tellus, ac feugiat est scelerisque sodales. Sed dapibus sed metus ac scelerisque. Cras sagittis nulla et lacus sodales, id aliquam risus porta. Aenean porttitor arcu et leo consectetur, et mattis dui rhoncus. Aliquam blandit massa ex, ut dapibus ex convallis sit amet. Pellentesque lobortis eu.
]

= Showcase
== Emphasis
There are numerous emphasis variants available: *bold*, _italic_, #underline[underline], #strike[strikethrough], #overline[overline], `raw`, #smallcaps[smallcaps], #sub[subscript], #super[superscript].

== Quotes
You can also write block level quotes with attribution:
#quote(block: true, attribution: [Percy B. Shelley])[My name is Ozymandias, King of Kings!]
The next paragraph will then start here.

== Visual
You can use figures to place different content on the page, like tables, images, and code.

#figure(caption: [Table showcasing different alignments for its content])[
  #table(
    columns: 4,
    align: (right, left, left, center),
    table.hline(),
    table.header([Right], [Left], [Default], [Center]),
    table.hline(stroke: 0.5pt),
    [12], [12], [12], [12],
    [123], [123], [123], [123],
    [1], [1], [1], [1],
    table.hline(),
  )
] <tableone>

#figure(caption: [This should float to the bottom], placement: auto)[
  ```rust
  let rs = Option::Some(true);
  // yeah, it is a thing
  // ofc
  ```
] <listingone>

Some text that is after the code listing in the source, but stays above it in the layouted content. That is because the code listing is set to float to the closest edge.

#pagebreak()

#figure(caption: [CTU logo])[
  #image("../assets/ctu_logo_black.svg", width: 30mm, height: 30mm)
] <imageone>

== Lists
- You can use normal
- bullet point lists
  - and with different markers
    - as well!
- which are tightly packed

#[
  // You can change the marker for lists like this, and it will apply within the content block
  #set list(marker: ([:], [\$], [>]))

  We can also have multi-paragraph lists (and change markers):

  - unordered lists with a long paragraph because
    sometimes we need to have long text in a thingy and some more text \

  - #lorem(20)
    - you can even have different markers here
      - for any number of sub-levels

  - #lorem(10)
]

There are also different list variants, like numbered lists:
+ ordered lists
  + with sub-numberings as well
+ are cool
+ as well

And term lists:
/ Term: there are also
/ Other: term lists
/ Which: are possible

#pagebreak()

== Math

#theorem()[
  This is a theorem that offers a profound insight into the
  mathematical sectioning commands.
]

#theorem([Another theorem])[
  This is another theorem. Unlike the
  first one, this theorem has been endowed with a name.
]

#lemma()[
  Let us suppose that $x^2 + y^2 = z^2$. Then
  $
    x^2 + y^2 &= z^2 #<eq1> \
    lr(angle.l u | sum_(i=1)^n F(e_i,v)e_i angle.r) &= F (sum_(i=1)^n angle.l e_i | u angle.r e_i, v)
  $
] <lemma>

#proof([of @lemma])[
  $gradient^2f(x, y) = (partial^2 f) / (partial x^2) + (partial^2 f) / (partial y^2)$
]

#corollary[
  _This is a corollary_
]

#remark()[
  This is a remark
]


== Code

You can write code blocks with the help of the #underline[codly] package, and put them in figures as listings. Code blocks within listings can be referenced: the whole block @codeblock, or the specific line @codeblock:6.
#codly-offset(offset: 4)
#figure(caption: "A code block with a label")[
  ```cs
  // create opponents
  List<Trainer> opponents =
      Enumerable.Range(0, OpponentCount)
          .Select(_ => Trainer.Random(StartingFimonAmount))
          .ToList();
  ```
] <codeblock>


Or you can just leave the code blocks in the wild.
```rust
let rs = Option::Some(true);
// yeah, it is a thing
// ofc
```

#pagebreak()
Additionally, you can use the #underline[lovelace] package to create stunning pseudocode:
#pseudocode-list(hooks: .5em, title: smallcaps[Fancy algorithm])[
  + *in parallel for each* $i = 1, ..., n$ *do*
    + fetch chunk of data $i$
    + *with probability* $exp(-epsilon_i slash k T)$ *do*
      + perform update #line-label(<label1>)
    + *end*
  + *end*
]

And of course, you can reference lines inside that pseudocode: @label1.

== Other

=== Symbols

You can use any symbols, including non-breaking spaces, which are kinda~funny~when~you~use~a~lot of them
There is a #sym.AA sym module, and even an #emoji.face.skeptic emoji

=== Links and references

You can:
- #link(<linklabel>)[Link to other labels of the document (this text is clickable)] \
- Reference them by their name: @linklabel, @tableone, @imageone
- Reference stuff from the bibliography: @harry, #cite(<electronic>, form: "prose"), #cite(<Vrabcova2021thesis>, form: "prose")

#bibliography(("works.bib", "works.yml"))
