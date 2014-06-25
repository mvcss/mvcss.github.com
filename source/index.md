---
title: Overview
type: page
priority: 1
---

Overview
========

**MVCSS** [Modular View CSS] is a Sass-based CSS architecture for creating predictable and maintainable application style.

CSS, for all its simplicity, is a difficult language to manage in large-scale implementations. Naming, paths to abstraction, structure, and methodologies are all free-form; MVCSS seeks to provide order for these sorts of projects.

Keeping with the architecture motif, applications are split into three major categories: [*Foundation*][foundation], [*Components*][components], and [*Structures*][structures]. If Foundation represents tools, materials, and the ground level, Components are akin to creating a window from those materials, and Structures would be a number of windows and doors creating a wall.

<!-- Nicktique: not something we need for the initial launch of v4, but something visual here would really help drive the main structure point home. An illustrated diagram of the foundation -> component -> structure setup, perhaps. -->

For a very early taste, here’s what a simple Component might consist of:

<!-- Nicktique: we should pare this example down a bit, and perhaps even remove the variables. The structure is the most important part, so we want as few surprises as possible. -->

```sass
// *************************************
//
//   Card
//   -> Individual style containers
//
// *************************************

.card
  background: $c-invert
  border-radius: $b-borderRadius
  box-shadow: $b-boxShadow
  padding: $b-whitespace
  position: relative

// -------------------------------------
//   Modifiers
// -------------------------------------

// ----- Sizes ----- //

.card--s
  padding: $b-whitespace-s

// ----- Theme ----- //

// Hierarchy

.card--b
  background: $c-highlight

// Error

.card--error
  border: 2px $b-borderStyle $c-error
  box-shadow: none

// -------------------------------------
//   Scaffolding
// -------------------------------------

// ----- Label ----- //

.card-label
  font-size: $fontSize-s
  font-weight: bold
  text-transform: uppercase
```

There’s no shortage of wonderful frameworks, ideas, and methods for tackling CSS across the web, and MVCSS wouldn’t exist without a few of these. Take a look at the [Resources][resources] section to find out more about our architectural roots.


[components]: /components
[foundation]: /foundation
[resources]: /resources
[structures]: /structures
