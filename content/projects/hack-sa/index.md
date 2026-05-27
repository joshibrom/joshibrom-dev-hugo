+++
title = "HackSA Website / Hacker Portal"
date = 2023-10-01T20:43:38-05:00
lastmod = 2023-10-01T20:43:38-05:00
draft = false
description = "The website for HackSA, a hackathon hosted by the ACM chapter at Texas A&M University-San Antonio."
slug = "hack-sa"
weight = 0              # Controls sort order on the projects list page

# Project specifics
stack = ["Next.js", "React", "Vercel", "Firebase"]              # e.g. ["Go", "PostgreSQL", "Docker"]
role = "Full-Stack Developer"               # e.g. "Sole developer", "Backend lead"
status = "archived"             # e.g. "active", "archived", "in progress"

# Links
repo_urls = [
  { title = "GitHub", href = "https://github.com/acm-tamusa/HackSA-Website" }
]
live_urls = [
  { title = "Vercel", href = "https://hack-sa.vercel.app/" }
]
case_study_url = ""     # If you write a separate deep-dive post

# Media
cover_image = "hack-sa.png"        # Used in project cards and OG image
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

HackSA is a hackathon hosted by the ACM chapter at Texas A&M University - San Antonio, of which I am a member. This was our
university's first 24-hour hackathon, and I served on the web team as a fullstack developer. I mainly assisted with resolving
various bugs and issues that arose during development, as well in aiding in making sense of the codebase, which was forked from
[HackPortal](https://github.com/acmutd/hackportal). Additionally, I designed the FAQ section on the homepage, as well as a page
in the admin dashboard for better-tracking a participant's scans of QR codes for each event.

<br />

There were numerous occassions for which the other members of the web team needed some issue resovled but were unsure of the files
that needed to be modified. I was able to assist them in finding the files and making the necessary changes to resolve the issue.

## Features

- User accounts and authentication
- Admin dashboard for managing events, users, and other aspects of the hackathon
- The ability to scan QR codes for events to track attendance

## Tech Stack

### Frontend

- The frontend is built with Next.js and React.
- TailwindCSS is used for styling. There are some components containing custom CSS / inline styles, but the majority of the
  styling is done with Tailwind, as are the specific components that I designed / implemented.
- Assets are stored in a Firebase storage bucket and are served from there.

### Backend

- Next.js API routes are used for the backend.
- The API routes interact with a Firebase Firestore which stores user information, event information, and other data.

### Deployment

- Deployment is handled by Vercel, which is the recommended deployment method for Next.js projects.

## Challenges

### Understanding the Codebase

The layout and naming conventions of the codebase were not very intuitive, and there were some inconsistencies in the way that
certain components were implemented. This made it difficult in some cases to understand how the code worked, but it did provide
a good learning experience in that I had to learn how to read and understand code that was written by someone else.

### Time

While I would have preferred there be more time to develop the website, we did push out a working product in time for the hackathon.
The members of the web team were all students, and we all had other responsibilities to attend to, so we were not able to devote
as much time to the project as we would have liked. However, we were able to get the website to a point where it was functional
and could be used for the hackathon.

### Calls to Firebase Firestore

As a result of the time constraint detailed above, there were some issues that we were not able to resolve. One of these issues
unfortunately was the manner in which the website would interact with the Firestore while being used. The HackPortal codebase
was designed to make a call to the Firestore every time a page was loaded, which was not ideal for our use case. As a result,
during the first 3 hours of the hackathon the website was down due to the number of requests being made to the Firestore. We
exceeded the free tier limit for Firestore, and the website was unable to make any more requests. I identified this as the issue
alongside one other member of the web team, and we remedied the issue by upgrading the Firestore plan to the Blaze plan, which
allows for more requests to be made. Being that the primary registration period for the hackathon was nearly over, we were able
to avoid any further issues with the Firestore.

One such fix that we could have looked in to was to cache the data from the Firestore in the frontend, and then make calls to
the Firestore only when necessary. This would have reduced the number of requests being made to the Firestore, and would have
allowed us to stay within the free tier limit. However, the damage had already been done, and thus we left the codebase alone.
This is something that I have voiced we should look in to with our planned rewrite of the website.

## Conclusion

Overall, I am proud of the work that I did on this project. I was able to learn a lot about working with a team on a project,
as well as how to read and understand code that was written by someone else. Working around the schedules of others was a
challenge, but it was a good learning experience. I am looking forward to the rewrite of the website, as I will be able to
apply what I have learned from this project to the rewrite.
