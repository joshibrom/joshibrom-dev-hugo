+++
title = "This Site"
date = 2026-05-25T07:12:21-05:00
lastmod = 2026-05-25T07:12:21-05:00
draft = true
description = "A minimalist developer portfolio and blog, built with Hugo. Focused on performance, semantic markup, and long-term maintainability."
slug = "joshibrom-dev"
weight = 100              # Controls sort order on the projects list page

# Project specifics
stack = ["Hugo", "Markdown"]
role = "Sole Developer"               # e.g. "Sole developer", "Backend lead"
status = "in progress"             # e.g. "active", "archived", "in progress"

# Links
repo_urls = [
  { title = "GitHub", href = "https://github.com/joshibrom/joshibrom-dev-hugo" }
]
live_urls = []
case_study_url = ""     # If you write a separate deep-dive post

# Media
cover_image = ""        # Used in project cards and OG image
images = []             # Additional screenshots

# Open Graph
og_title = ""
og_description = ""
og_image = ""           # Defaults to cover_image in templates if blank

# SEO
noindex = false         # Set true for private/client work you don't want indexed
canonical = ""
+++
## About

This site is my personal portfolio and blog where I intend to document my work,
share writing, and signal a transition from fullstack web development toward
systems and backend engineering.

It's built with Hugo, chosen for its speed, simplicity, and flexibility in
templating and styling. The design is intentionally minimal: monospace type, a
dark palette, and no JavaScript.

## On AI-assisted development

Parts of this site were built with meaningful help from Claude. I used it
throughout the process: from getting started with Hugo templating; ensuring a
clean, minimal, and maintainable SCSS architecture; to accessibility
auditing. I want to be upfront about that rather than obscure it.

I'm also treating this as an opportunity to think carefully about what
AI-assisted development actually looks like in practice--where it helps,
where it falls short, and what it means for ownership of the work. I'll be
writing more about this [in a forthcoming post](#).

## Design decisions

- Monospace type sitewide (IBM Plex Mono) as a deliberate craft signal
- Dark background with a gold accent, tuned to meet WCAG 2.0 AA contrast
- No client-side JavaScript (everything is static HTML and CSS)
- Page bundles for content to keep assets colocated with their source files
