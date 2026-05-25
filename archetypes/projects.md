+++
title = "{{ replace .File.ContentBaseName "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = true
description = ""        # What the project is/does — used in meta and project cards
slug = "{{ .File.ContentBaseName }}"
weight = 0              # Controls sort order on the projects list page

# Project specifics
stack = []              # e.g. ["Go", "PostgreSQL", "Docker"]
role = ""               # e.g. "Sole developer", "Backend lead"
status = ""             # e.g. "active", "archived", "in progress"

# Links
repo_urls = []
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
