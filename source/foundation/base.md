---
title: Foundation - Base
---

[csswizardry-margins]: http://csswizardry.com/2012/06/single-direction-margin-declarations/

## Base

Base contains all of the tag-level settings for default HTML elements. These are things like anchors, headings, paragraphs, lists, and everything else that doesn't have a class name attached. Because there are so many possible HTML elements to cover, we typically only style the ones relevant to a project as we need them.

We define `html` and `body` styles at the top, and then divide the remaining content into Block and Inline sections.

```sass
// *************************************
//
//   Base
//   -> Tag-level settings
//
// *************************************

html
  background: $c-background
  color: $c-base
  font-family: $f-base
  font-size: $b-fontSize
  line-height: $b-lineHeight

body
  font-size: 100%
```

### Block Content
Block content is made up of all the block-level elements needed in an MVCSS project. Typically, this section includes the aforementioned headings, paragraphs, lists, as well as figures, blockquotes, and more.

Collapsing margins, while an intentional feature of CSS, only add complexity when authoring style sheets, so we limit vertical margins on block-level elements to a [single-direction][csswizardry-margins].

```sass
// -------------------------------------
//   Block Content
// -------------------------------------

ul, p
  margin-bottom: $b-whitespace
  margin-top: 0

li
  margin-bottom: $b-whitespace-s
  margin-top: 0

// ----- Headers ----- //

h1, .h1,
h2, .h2,
h3, .h3,
h4, .h4
  font-family: $f-header
  font-weight: bold
  line-height: 1.2
  margin-bottom: $b-whitespace-xs
  margin-top: 0
```

### Inline Content
Inline content is made up of—you guessed it—inline elements. These include tags like `a`, `strong`, `em`, `code`, and any others that don't force a line break before and after themselves by default.

```sass
// -------------------------------------
//   Inline Content
// -------------------------------------

a
  border-bottom: $b-border
  color: $c-highlight
  text-decoration: none
  &:hover,
  &:focus
    border-bottom-color: $c-highlight
    color: $c-subdue
```
