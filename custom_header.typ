#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 1.2cm, y: 1.2cm),
)
#set text(
  size: 8.5pt,
)
#show table: set text(size: 7.5pt)

// Enable page breaking for figures and tables to prevent overlapping at page ends
#show figure: set block(breakable: true)
#show table: set block(breakable: true)
