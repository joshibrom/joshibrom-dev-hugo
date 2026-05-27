+++
title = "This Site (v2)"
date = 2024-06-30T20:59:23-05:00
lastmod = 2024-06-30T20:59:23-05:00
draft = false
description = "My previous portfolio/personal website (version 2)."        # What the project is/does — used in meta and project cards
slug = "portfolio-v2"
weight = 0              # Controls sort order on the projects list page

# Project specifics
stack = ["Astro", "Tailwind"]              # e.g. ["Go", "PostgreSQL", "Docker"]
role = "Sole Developer"               # e.g. "Sole developer", "Backend lead"
status = "archived"             # e.g. "active", "archived", "in progress"

# Links
repo_urls = [
  { title = "GitHub", href = "https://github.com/joshibrom/astro-v2.joshuaibrom.com" }
]
live_urls = []
case_study_url = ""     # If you write a separate deep-dive post

# Media
cover_image = "personal-site-v2.png"        # Used in project cards and OG image
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

This website is intended to be used as more of a personal portfolio for myself.

Building out this site was relatively simple, albeit not without its issues (I could
not get `sharp` to work on my Macbook no matter what I tried and thus am using
Sqoosh for image optimization). Overall, I'm happy with the result and feel much more
proud of this version both stylistically and in terms of performance.

## Tech Stack

### Frontend

- This website is built using [Astro](https://astro.build/), a static site generator
  boasting a modern developer experience with a focus on performance and extensibility.
  Markdown files are used to generate some pages (like this one).
- [Tailwind CSS](https://tailwindcss.com/) is used for styling.

## Previous Versions

- You may view v1 (the previous Astro-based version) [on GitHub](https://github.com/joshibrom/astro.joshuaibrom.com).
- Some previous versions of this website have been built with the following technologies
  (in order of most recent to least recent):
  1. React
  1. Django
  1. Vanilla HTML, CSS, JS: Built my senior year of high school (2016-2017)
