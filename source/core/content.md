---
title: Core / Content
---

# Content

The content section, along with the layout section, is the bridge between base-level tags and modules. It gives you the ability to set up content submodule abstractions that make contextual tweaks easier.

The difference between the content and layout modules is that the content applies mainly to typography (fonts, colors), while the layout section applies to just that, layout (margin, padding, sizing, positioning).

**Note**: The `c-` prefix is an implicit module. There is no `c` base module; it's only used as a prefix for the content modules.

## Headings

We set the headings in the content module rather than [base](/core/base/), because we want the ability to share heading styles.

```

h1, .c-h1, %c-h1
  font-size: 40px
  margin-bottom: 20px
```

Borrowed from OOCSS, sometimes we want an `h2` on a page to look like an `h3`. This gives us the ability to do that:

```

%h2.c-h3 Heading
```

Or, using the placeholder selector:

```

.tagline
  @extend %c-h3

%h2.tagline This is a tagline for my site.
```

## Utilities

We set default content utilities. Let's look at an example to show how this works. Here are a couple of the default utilities available to you:

```

%c-center, .c-center
  text-align: center

%c-condensed, .c-condensed
  font-size: 85%
```

And in your markup:

```

%form.form-field
  %input(type="text")
  %p.c-condensed This is a note.
```

Or, if you prefer to use [Sass placeholder selectors](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#placeholder_selectors_) as silent classes:

```

// example.haml
%form.form-field
  %input(type="text")
  %p.form-field-desc This is a note.

// _content.sass
.form-field-desc
  @extend %c-condensed
```

**Note**: You can set your own custom content utility modules for your project.

## Custom Submodules

You can extend multiple content utilities, or even form another content submodule:

```

.c-tagline
  @extend %c-center
  @extend %c-condensed
```

<a class="btn--b" href="/core/layout/">Next &rarr;</a>
