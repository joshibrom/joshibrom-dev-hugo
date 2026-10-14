#let data = toml("data/resume.toml")

// ---------- Design Tokens (Charcoal & Rust) ----------
#let brand-dark   = rgb("#1c1917") // Stone 900
#let brand-accent = rgb("#9a3412") // Rust / Amber 800
#let text-main    = rgb("#292524") // Stone 800
#let text-muted   = rgb("#78716c") // Stone 500
#let bg-tag       = rgb("#fbf6f3") // Pale warm sand
#let border-tag   = rgb("#fed7aa") // Amber 200 border
#let text-tag     = rgb("#7c2d12") // Amber 900 text
#let border-rule  = rgb("#e7e5e4") // Stone 200 rule

#let sans-font = ("IBM Plex Sans", "DejaVu Sans")
#let mono-font = ("IBM Plex Mono", "DejaVu Sans Mono")

#let sec-space-start = 0.45em
#let sec-space-end = 0.2em

#let sec-title-sz = 10.5pt
#let title-sz = 10pt

#let margin-x = 0.50in
#let margin-y = 0.38in

#set document(title: data.name + " — Resume", author: data.name)
#set page(paper: "us-letter", margin: (x: margin-x, top: margin-y, bottom: margin-y))
#set text(font: sans-font, size: 9.75pt, fill: text-main, lang: "en")
#set par(justify: false, leading: 0.46em, spacing: 0.48em)
#set list(marker: text(fill: brand-accent, size: 6.5pt)[■], indent: 0.3em, body-indent: 0.45em, spacing: 0.36em)

// ---------- Helpers ----------
#let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
#let fmt-date(s) = {
  let parts = s.split("/")
  if parts.len() == 2 { months.at(int(parts.at(0)) - 1) + " " + parts.at(1) } else { s }
}

#let when(obj) = {
  if "start_date" in obj {
    fmt-date(obj.start_date) + " – " + (if "end_date" in obj { fmt-date(obj.end_date) } else { "Present" })
  } else if "date" in obj {
    fmt-date(obj.date)
  } else {
    "Ongoing"
  }
}

#let rich(s) = {
  s.split("__").enumerate().map(((i, chunk)) => {
    let piece = chunk.split("`").enumerate().map(((j, subchunk)) => {
      if calc.odd(j) { raw(subchunk) } else { subchunk }
    }).join()
    if calc.odd(i) { strong(piece) } else { piece }
  }).join()
}
#let bullets(items) = list(..items.map(b => [#rich(b)]))
#let url(u) = if u.starts-with("http") { u } else { "https://" + u }

#let section-heading(title) = {
  v(sec-space-start)
  grid(
    columns: (auto, 1fr),
    gutter: 0.8em,
    align: (left, horizon),
    text(font: sans-font, size: sec-title-sz, weight: "black", fill: brand-dark, tracking: 0.1em)[#upper(title)],
    line(length: 100%, stroke: 0.75pt + border-rule)
  )
  v(sec-space-end)
}

#let tag(body) = box(
  fill: bg-tag,
  stroke: 0.4pt + border-tag,
  radius: 2pt,
  inset: (x: 4pt, y: 1.2pt),
  outset: 0pt,
  text(font: mono-font, size: 7.2pt, fill: text-tag, weight: "medium")[#body]
)

// ---------- Header ----------
#let site-link(label, obj) = link(url(obj.href))[#text(fill: brand-accent, weight: "medium")[#label]]

#let contact-items = (
  if "location" in data { text(fill: text-muted)[#data.location] },
  data.at("phone", default: none),
  if "email" in data { link("mailto:" + data.email)[#data.email] },
  if "website" in data { link(url(data.website.href))[#data.website.title] },
  if "github" in data { site-link("GitHub", data.github) },
  if "linkedin" in data { site-link("LinkedIn", data.linkedin) },
).filter(x => x != none)

#align(center)[
  #text(font: sans-font, size: 21pt, weight: "bold", fill: brand-dark, tracking: -0.02em)[#data.name]
  #v(0.2em)
  #text(size: 8.8pt)[#contact-items.join(h(0.55em) + text(fill: border-rule)[|] + h(0.55em))]
]

// ---------- Technical Skills ----------
#if "skills" in data and data.skills.len() > 0 {
  section-heading("Technical Skills")
  grid(
    columns: (1.5fr, 5fr),
    row-gutter: 0.35em,
    column-gutter: 1em,
    ..data.skills.map(s => (
      text(weight: "bold", fill: brand-accent, size: 8.8pt)[#s.category],
      text(size: 8.8pt)[#s.items.join(text(fill: text-muted)[ · ])],
    )).flatten()
  )
}

// ---------- Experience (Grouped by Employer with Timeline Rail) ----------
#if "employment" in data and data.employment.len() > 0 {
  section-heading("Work Experience")
  for emp in data.employment [
    #block(breakable: false, above: 0.55em, below: 0.35em)[
      // Parent Employer Header
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(weight: "bold", size: title-sz + 0.5pt, fill: brand-accent)[#emp.employer],
        text(font: mono-font, size: 8pt, fill: text-muted)[#emp.location],
      )
      #v(0.2em)

      // Timeline Rail Container
      #block(
        stroke: (left: 1.2pt + border-rule), // Connecting vertical line
        inset: (left: 0.65em),               // Indent roles from the line
        outset: (left: 0pt, y: 0.1em),
      )[
        #for role in emp.roles.filter(r => r.at("print", default: true)) [
          #block(above: 0.45em, below: 0.35em)[
            #grid(
              columns: (1fr, auto),
              align: (left, right),
              [
                #text(weight: "bold", size: title-sz, fill: brand-dark)[#role.title]
                #if "team" in role [
                  #h(0.35em) #text(fill: text-muted)[—] #h(0.35em)
                  #text(size: 8.8pt, style: "italic", fill: text-muted)[#role.team]
                ]
              ],
              text(font: mono-font, size: 8pt, fill: text-muted)[#when(role)],
            )
            #v(0.15em)
            #bullets(role.bullets)
          ]
        ]
      ]
    ]
  ]
}

// ---------- Projects ----------
#if "project" in data and data.project.len() > 0 {
  section-heading("Featured Projects")
  for proj in data.project {
    block(breakable: false, above: 0.55em, below: 0.35em)[
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        [
          #text(weight: "bold", size: title-sz, fill: brand-dark)[#proj.title]
          #if "category" in proj {
            h(0.4em)
            text(size: 8pt, style: "italic", fill: text-muted)[(#proj.category)]
          }
          #if "stack" in proj {
            h(0.4em)
            proj.stack.map(s => tag(s)).join(h(2.5pt))
          }
        ],
        text(font: mono-font, size: 8pt, fill: text-muted)[#when(proj)]
      )
      #v(0.18em)
      #bullets(proj.bullets)
    ]
  }
}

// ---------- Education ----------
#if "education" in data and data.education.len() > 0 {
  section-heading("Education")
  for edu in data.education {
    block(breakable: false, above: 0.45em, below: 0.25em)[
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [
          #text(weight: "bold", size: title-sz, fill: brand-dark)[#edu.degree]
          #h(0.35em) #text(fill: text-muted)[—] #h(0.35em)
          #text(fill: text-main)[#edu.school]
          #if "gpa" in edu {
            h(0.45em)
            tag("GPA: " + str(edu.gpa) + " / 4.0")
          }
        ],
        text(font: mono-font, size: 8pt, fill: text-muted)[#when(edu)]
      )
    ]
  }
}

// ---------- Leadership & Service ----------
#if "professional_service" in data and data.professional_service.len() > 0 {
  section-heading("Leadership & Service")
  for s in data.professional_service {
    block(breakable: false, above: 0.45em, below: 0.25em)[
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [
          #text(weight: "bold", size: title-sz, fill: brand-dark)[#s.title]
          #h(0.35em) #text(fill: text-muted)[—] #h(0.35em)
          #text(weight: "medium", fill: brand-accent)[#s.organization]
        ],
        text(font: mono-font, size: 8pt, fill: text-muted)[#when(s)]
      )
      #v(0.18em)
      #bullets(s.bullets)
    ]
  }
}
