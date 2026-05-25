+++
title = "Fossil Finances"
date = 2024-02-25T06:11:21-05:00
lastmod = 2024-02-25T06:11:21-05:00
draft = false
description = "Winner of the 2024 RowdyHacks SWIVEL challenge, Fossil Finances is a web app boasting accessible and senior-friendly financial tools."
slug = "fossil-finances"
weight = 0              # Controls sort order on the projects list page

# Project specifics
stack = ["React", "Flask", "Firebase"]
role = "Full-Stack Developer"
status = "archived"

# Links
repo_urls = [
  { title = "GitHub", href = "https://github.com/Joshua-Ludolf/FossilFinances" }
]
live_urls = []
case_study_url = ""     # If you write a separate deep-dive post

# Media
cover_image = "cover.png"
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

Fossil Finances is a web app tailored to the needs of senior citizens, providing
them with a suite of financial tools that are accessible and easy to use. The
app was developed as part of the 2024 RowdyHacks SWIVEL challenge, which tasked
participants with creating a fintech application that would be useful to senior
citizens. The app was developed by a team of 3, and I was responsible for
managing the communication between the frontend, Flask backend, and Firebase
instance, as well as implementing some state management and route handling in
the frontend.

## Features

- Accessible, large buttons and text for easy use
- Texts are sent to the user's phone to show new purchases and other account
  transactions
- Resources are provided to help users learn about financial literacy and how to
  avoid common pitfalls.

## Tech Stack

### Frontend

- __React__: Client-side reactivity and component-based architecture
- __TailwindCSS__: Consistent styling with a positive DX

### Backend

- __Flask__: Runs our API and handles sending texts to a user's phone
- __Firebase__: Handles user authentication and data storage
