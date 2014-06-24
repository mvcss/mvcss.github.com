---
title: Components
type: page
priority: 14
---

Components
==========

The Components folder is where we start building the recognizable pieces of a user interface. These are abstract, reasonably portable modules that can be swapped in and out of different projects with relative ease.

Some Components, like `grid` and `card`, are used for layout and containers, and can encompass many other modules.

```html
<div class="grid">
  <div class="grid-box grid-box--1of2">
    <div class="card">
      <!-- Content -->
    </div>
  </div>
  <div class="grid-box grid-box--1of2">
    <div class="card">
      <!-- Content -->
    </div>
  </div>
</div>
```

Other Components, like `thumb`, affect only a single element, and can resemble Tools at first glance. In these situations, both the Component and Tool have a single responsibility. The *Component*, however, may be declared alongside its modifier classes, while the Tool applies more definitive styles.

```html
<div class="bucket">
  <div class="bucket-media">
    <img class="thumb thumb--m" src="avatar-nick.jpg" alt="Nick Walsh">
  </div>
  <div class="bucket-content">
    <p>Nick Walsh</p>
  </div>
</div>
```

Characteristics
---------------

When determing whether a module is a Component or Structure, we find it helpful to ask ourselves the following questions:

- Does this module limit its scope as much as possible?
- Does this module depend on or extend other Components?
- Is this module abstract enough to use in other projects without making significant changes?

<!-- Nicktique: second line ('Does this depend on / extend other Components') sounds like a Structure -->

If you answer "no" to any of these questions, the module in question is more than likely a Structure.
