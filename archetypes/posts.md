+++
title = "{{ replace .File.ContentBaseName "-" " " | title }}"
date = {{ .Date }}
lastmod = {{ .Date }}
draft = true
description = ""        # Meta description — keep under 160 chars
slug = "{{ .File.ContentBaseName }}"
tags = []
categories = []

# Open Graph / social sharing
og_title = ""           # Falls back to title if blank in your templates
og_description = ""     # Falls back to description if blank
og_image = ""           # Absolute or relative path to a cover image

# Optional but useful
canonical = ""          # Set if this post is republished from elsewhere
series = ""             # For grouping multi-part posts
+++
