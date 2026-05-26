+++
title = "Building With Hugo"
date = 2026-05-25T13:26:46-05:00
lastmod = 2026-05-25T13:26:46-05:00
draft = false
description = "Notes on building this site: Hugo internals, accessible design, and honest reflections on working with AI tooling."        # Meta description — keep under 160 chars
slug = "building-with-hugo"
tags = ["hugo", "ssg", "web-development", "accessibility"]
categories = ["dev-notes"]

# Open Graph / social sharing
og_title = ""           # Falls back to title if blank in your templates
og_description = ""     # Falls back to description if blank
og_image = ""           # Absolute or relative path to a cover image

# Optional but useful
canonical = ""          # Set if this post is republished from elsewhere
series = "building-this-site"             # For grouping multi-part posts
+++
I've recently completed my Master of Science in Computer Science from Texas
A&M University-San Antonio. During the time leading up to the completion of my
degree I found myself having a desire to re-write and modernize my personal
website, concluding that
[my old website](https://github.com/joshibrom/astro.joshuaibrom.com) was too
stale in content and style. I wanted a platform that was more dynamic and would
have less friction when developing new features. My previous _v2_ site was
built using [Astro](https://astro.build), a powerful static site generator (SSG)
that has a plethora of features and support for many popular front-end
frameworks/libraries. Astro also features an ever-changing API and method of
designing your website and the content collections within--changes which I felt
that I could forgo if I chose another SSG that was not JS-dependent.

I did consider building my own SSG in both Zig and Rust. I chose to write the
Zig implementation as a purely zero-allocator design, avoiding
application-managed heap allocation entirely and instead using `mmap`
(see [std.posix.mmap](https://ziglang.org/documentation/0.16.0/std/#std.posix.mmap))
to obtain memory directly through the operating system via pages which are
mapped into the process address space rather than allocating memory on the heap
through a conventional allocator. This design, of course, has its limitations.
For example, the zero-allocator nature of the program meant that I'd have to
stream the input to the output through some pipeline, making me elect to use
a wrapper-based approach to the overall output data structure--a schema that
works well for HTML and it's element trees in simple cases but falls apart once
I intend to have an element with some runtime-known $n$ number of children. This
meant that I'd have to spend more time researching the problem and re-writing my
design at a time when I just wanted _something_ published.

## Why Hugo (et al)

[Hugo](https://gohugo.io) is a fast and [moderately popular](https://github.com/gohugoio/hugo/stargazers)
static site generator. The project is Apache 2.0-licensed and actively
maintained, making it a solid and future-proof choice for a static site
generator. The method by which the application is maintained is also fairly
stable, meaning that for most cases the methods that I learn now to build a
website should be relatively the same in the future should I elect to build
another site with Hugo. This simplicity leads to the main reason why I chose
Hugo: I could get a website up and running ___blazingly fast___ (yes,
intentionally). This could allow me to get content up sooner to showcase myself
while also showing me the thoughtful design decisions that I could make when I
do decide to re-visit my own SSG implementation whether it still be in Zig or be
moved to Rust.

Other design decisions that were made were things like the design itself--from
the dark colorscheme with thoughtful pops of color to the typography and
spacing of the elements so that the copy could breathe and speak for itself in
a content-forward manner. The colors were chosen to be easy on the eyes and
compliant with WCAG 2.0 AA contrast standards. I wanted the whole site to signal
"minimalist backend engineer", and I feel that I captured that feeling to the
best of my ability while yielding a design that also feels modern.

## What Hugo has Taught Me

Aforementioned was my intention to just get a website up and running and to
analyze the design of the website and the tooling for it as the site is being
built. I would like to think that Hugo has given me a masterclass in SSG design
and has made me more confident that I could some day produce my own SSG, not
that it's needed at this point but I am of course a nerd who loves to build. I
believe that Hugo, once the basics of its use are understood, can afford an
engineer a positive and fast developer experience (DX)--a metric which I feel is
hugely important since a positive DX can lead to a better end-product.

Of course, not everything went smooth and there were learning lessons that had
to be made. I am a developer who likes to read the API-specific documentation
for software and who greatly appreciates "compiler-assisted programming" wherein
I use the compiler and its generated errors/warnings to guide my development and
learning where appropriate (of course if there's a business cost I won't do
this). Hugo's documentation, while much better than some of the other options
out there, I do find to be lacking. This led to initial friction in
understanding how to get a simple website structure that wasn't a foot-gun
waiting to go off and this led me to look for other options for learning. Enter
[Claude](https://claude.ai).

## On Working with AI Tooling

I'll be upfront: I came into this project mildly dissatisfied with LLMs.
My graduate coursework had over-applied them to the point where assignments
frequently became exercises in analyzing generated output rather than
developing genuine understanding—the equivalent of reaching for a calculator
before you understand what the calculation is actually doing. I don't think
that's the fault of the tooling itself, but it left me wanting to be more
deliberate about _when_ and _how_ I reached for it.

For this project I chose to use [Claude](https://claude.ai), treating it less
like an answer machine and more like a knowledgeable collaborator or coworker
that I could bounce ideas off of and ask for another set of eyes when I'd get
stuck. The results were concretely useful: it caught that `coalesce` isn't a
Hugo built-in when I hit a template parsing error, walked me through an issue
with generated page bundle image paths resolving cover images to the site root,
and ran a WCAG 2.0 AA contrast audit against the palette before I'd written a
line of real CSS. Things I could have figured out myself, but faster—and with
enough explanation that I actually understood _what was wrong_ rather than _just
having it fixed_.

I wouldn't reach for AI tooling for business logic or anything where
genuine understanding is the point. But for navigating an unfamiliar
ecosystem, auditing decisions, and getting unstuck without losing momentum,
it's a legitimate part of the workflow (provided you've built enough
foundation to know when the output is wrong).

## The End Result ... Sort Of

This site is now a maintainable, fast, and accessible platform that I'm
actually motivated to write for, which was the point. The more lasting output,
however, might be everything adjacent to it: a clearer picture of what my own
SSG would need to handle, a more honest understanding of where AI tooling
earns its place, and a design system I can carry forward.

The Zig implementation is on pause, not abandoned. I know myself and that, in
time, I'll write the SSG tooling "for the heck of it." I believe I now know
where my attempt broke down and have a rough understanding of what would be
needed to fix it. Such is the nature of software engineering.
