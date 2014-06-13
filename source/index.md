# About

<p class="c-lead"><strong>MVCSS</strong> [Modular View CSS] is a Sass-based CSS architecture for creating predictable and maintainable application style.</p>

CSS, for all its simplicity, is a difficult language to manage in large-scale implementations. Naming, paths to abstraction, structure, and methodologies are all free-form; MVCSS seeks to provide order for these sorts of projects.

Keeping with the architecture motif, applications are split into three major categories: *Foundation*, *Components*, and *Structures*. If Foundation represents tools, materials, and the ground level, Components are akin to creating a window from those materials, and Structures would be a number of windows and doors creating a wall.

For a very early taste, here’s what a simple Component might consist of:

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

Don’t worry about the odd class names quite yet, we’ll cover the thinking behind those in Foundation.

There’s no shortage of wonderful frameworks, ideas, and methods for tackling CSS across the web, and MVCSS wouldn’t exist without a few of these. Take a look at the Inspiration(link) section to find out more about our architectural roots.
