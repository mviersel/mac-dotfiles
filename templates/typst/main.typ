#import "template.typ": normal-doc

#set document(
  title: [Mijn document],
  author: "Mijn Naam",
)

#show: normal-doc.with(
  title: [Mijn document],
  author: [Mijn Naam],
  date: [14 september 2026],
  numbered-headings: false,
)

= Inleiding

Dit is mijn eerste paragraaf.

Een nieuwe paragraaf begint na een lege regel.

== Achtergrond

Dit is een tweede sectie met *vetgedrukte tekst* en
_cursieve tekst_.

- Eerste punt
- Tweede punt
- Derde punt

#pagebreak()

= Volgend hoofdstuk

Deze heading begint door de expliciete page break op een
nieuwe pagina.

== Conclusie

Hier komt de conclusie.
