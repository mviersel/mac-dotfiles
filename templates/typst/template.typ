#let normal-doc(
  title: none,
  author: none,
  date: none,
  numbered-headings: false,
  doc,
) = {
  // --- Pagina ---
  set page(
    paper: "a4",
    margin: 2.5cm,
    numbering: "1",
    number-align: center + bottom,
  )

  // --- Basistekst ---
  set text(
    font: "Libertinus Serif",
    size: 11pt,
    lang: "nl",
  )

  // --- Paragrafen ---
  set par(
    leading: 0.65em,
    spacing: 0.8em,
    justify: false,
  )

  // --- Headings ---
  if numbered-headings {
    set heading(numbering: "1.")
  }

  // --- Titelblok ---
  if title != none {
    align(center)[
      #text(18pt, weight: "bold")[#title]

      #if author != none {
        v(0.5em)
        author
      }

      #if date != none {
        v(0.3em)
        date
      }
    ]

    v(2em)
  }

  // --- Documentinhoud ---
  doc
}
