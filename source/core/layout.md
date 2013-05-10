---
title: Core / Layout
---

# Layout

Just like the [content](/core/content/) module, the layout module gives you a higher level of abstraction for your modules.

**Note**: The `l-` prefix is an implicit module. There is no `l` base module, but it's only used as a prefix for the content modules.

A good example of a layout submodule is what we call the `cell` module (`l-cell`), which gives your site a `max-width`, centers it, and applies horizontal padding. Let's take a look:

```

%l-cell, .l-cell
  margin: 0 auto
  max-width: 900px
  padding: 0 60px
```

## Utilities &amp; Custom Submodules

Just like the [content](/core/content/) module, there are default utilities provided to you, and you can create your own custom submodules as well. Be sure to read through the **MVCSS** project files to get familiarized.
