---
title: Basics
type: page
priority: 3
parent: Styleguide
nested: true
---

Styleguide - Basics
===================

Style Sheets
------------

- Alphabetize properties (vendor-prefixed properties sorted by their non-prefixed equivalent)
- Extends and Mixins should be placed before standard properties
- Use soft tabs with a two space indention
- Add a space after `:`
- Add a space after `//` comments
- Add a space after commas in values (e.g. `rgba(#000, 0.5)`)
- Stick with classes instead of IDs for styling
- Limit nesting as much as possible

```sass
// Example

.component
  @extend .group
  +transition(opacity 0.2s ease-in-out)
  border-radius: 5px
  box-shadow: 0 2px 5px rgba(#000, 0.5)
  -webkit-flex: 1 1 50%
  -ms-flex: 1 1 50%
  flex: 1 1 50%
  font-style: italic
```

Markup
------

- Alphabetize classes, ordered by Component, Structure, Tool, state, and context
- Apply modifier classes after each individual module

```html
<div class="g collection collection--1of3 bch mtl tci is-active has-dropdown"></div>
```
