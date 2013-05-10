---
title: Core - Layout
---

# Layout

Just like [Core - Content](/core/content/), the **Core - Layout** gives you a higher level of abstraction for your modules.

**Note**: The `l-` prefix is an implicit module. There is no `l` base module; it's only used as a prefix for the layout modules.

A good example of a **Core - Layout** submodule is what we call the `cell` module (`l-cell`), which gives your site a `max-width`, centers it, and applies horizontal padding. Let's take a look:

```sass
%l-cell, .l-cell
  margin: 0 auto
  max-width: 900px
  padding: 0 60px
```

## Utilities &amp; Custom Submodules

Just like [Core - Content](/core/content/), there are default utilities provided to you, and you can create your own custom submodules as well. Be sure to read through the **MVCSS** project files to get familiarized.
