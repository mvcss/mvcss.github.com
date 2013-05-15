---
title: Core - Content
---

# Content

**Core - Content** and [Core - Layout](/core/layout/) are the bridge between base-level tags and modules. They give you the ability to set up abstractions that make contextual tweaks easier.

The difference between **Core - Content** and [Core - Layout](/core/layout/) is that **Core - Content** applies mainly to typography (fonts, colors), while [Core - Layout](/core/layout/) applies to just that, layout (margin, padding, sizing, positioning).

**Note**: The `c-` prefix is an implicit module. There is no `c` base module; it's only used as a prefix for the content modules.

## Headings

We set the headings in the **Core - Content** rather than [Core - Base](/core/base/), because we want the ability to share heading styles.

```sass
h1, .c-h1, %c-h1
  font-size: 40px
  margin-bottom: 20px
```

Borrowed from OOCSS, sometimes we want an `h2` on a page to look like an `h3`. This gives us the ability to do that:

```haml
%h2.c-h3 Heading
```

Or, using the placeholder selector:

```sass
.tagline
  @extend %c-h3

%h2.tagline This is a tagline for my site.
```

## Utilities

We set default **Core - Content** utilities. Let's look at an example to show how this works. Here are a couple of the default utilities available to you:

```sass
%c-center, .c-center
  text-align: center

%c-condense, .c-condense
  font-size: 85%
```

And in your markup:

```haml
%form.form-field
  %input(type="text")
  %p.c-condense This is a note.
```

Or, if you prefer to use [Sass placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholder_selectors_) as silent classes:

```haml
%form.form-field
  %input(type="text")
  %p.form-field-desc This is a note.
```

```sass
.form-field-desc
  @extend %c-condense
```

**Note**: You can set your own custom content utility modules for your project.

## Custom Submodules

You can extend multiple content utilities, or even form another content submodule:

```sass
.c-tagline
  @extend %c-center
  @extend %c-condense
```

<a class="btn--b" href="/core/layout/">Next &rarr;</a>
