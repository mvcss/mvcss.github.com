---
title: Naming Conventions
type: page
priority: 6
parent: Styleguide
nested: true
---

Styleguide - Naming Conventions
===============================

Following ideas pioneered in [BEM][bem-definitions] and [SUIT][suit-naming-conventions], MVCSS has a strict series of naming conventions that provide context at a glance.

Tools
-----

As you may notice in `_tools.sass`, many of the Tool classes look pretty acronym-y. We’ll get into the gains inherent with defining Tools shortly, but for now just assume two- or three-letter classes fall under this notion.

A class such as `.mbm` is a shorthand way to define a basic unit of bottom margin: **m**argin **b**ottom **m**edium. Similarly, `.mbl` would be the large variety of bottom margin.

Components/Structures
---------------------

Structures and Components exist as Sass partials in their respective directories, and are always singular. Examples include `icon`, `button`, `grid`, `form`, and `modal`.

If the name comprises two words, utilize `camelCase`&mdash;for instance, `taskList`.

Modifiers
---------

After defining the base properties of a Component or Structure, modifiers exist to allow stylistic tweaks that build on the initial definition.  These tweaks are denoted with two hyphens `--`. A button, for instance, might have a number of different colors and sizes:

```sass
// *************************************
//
//   Button
//   -> Action points
//
// *************************************

.btn
  border: 0
  display: inline-block
  line-height: 2.5
  padding: 0 $b-whitespace
  font-weight: bold

// -------------------------------------
//   Modifiers
// -------------------------------------

// ----- Sizes ----- //

.btn--s
  font-size: 75%

.btn--l
  font-size: 150%

// ----- Theme ----- //

// Hierarchy

.btn--a
  background: $c-base

.btn--b
  background: $c-highlight
```

After creation, elements that need a modifier will use the root class (`.btn`) and any number of modifiers deemed necessary:

```html
<button class="btn btn--a btn--l">A Button</button>
```

**Note:** modifiers typically work best when defined in hierarchical sequence (`a`, `b`) or via function (`cancel`, `submit`) as opposed to look (`red`, `blue`).

States
------

Generally added via JavaScript, states are similar to modifiers but carry conditional context. `is-` denotes a state, such as `is-active`, and they’re utilized as such:

<!-- Nicktique: should probably explain that compound selectors are used here so that states can be used elsewhere (is-active might apply to a bunch of items differently). -->

```sass
// *************************************
//
//   Button
//   -> Action points
//
// *************************************

.btn
  // Styles

// Modifiers

// -------------------------------------
//   States
// -------------------------------------

.btn.is-active
  background: $c-highlight
```

Context
-------

We also borrow the idea of context from SUIT. Modularizing styles into self-contained units works well *most* of the time, but you’ll occasionally need a parent element to fall in line.

The most common case tends to be positioning context. If you have a dropdown structure that’s being positioned absolutely, the parent element should be (at least) positioned relatively:

```sass
// *************************************
//
//   Dropdown
//   -> Revealed information
//
// *************************************

.dropdown
  // Styles

// Modifiers, States

// -------------------------------------
//   Context
// -------------------------------------

.has-dropdown
  position: relative
```

Similar to `is-` with states, classes beginning with `has-` denote a context selector.

Scaffolding
-----------

Elements nested within a Component or Structure that need styling *based on being there* can be added to the scaffolding. Keeping with the dropdown Structure, the scaffold section falls last:

```sass
// *************************************
//
//   Dropdown
//   -> Revealed information
//
// *************************************

.dropdown
  // Styles

// Modifiers, States, Context

// -------------------------------------
//   Scaffolding
// -------------------------------------

.dropdown-media
  border: 4px solid $c-invert
```

For items in scaffolding, the Component/Structure name comes first, followed by a single hyphen and the subcomponent/substructure name (also in camelCase, if necessary). Where applicable, they can have their own modifiers, states, and subcomponents/substructures&mdash;more than two levels, though, typically means it’s time to refactor.

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

// Modifiers, States, Context

// -------------------------------------
//   Scaffolding
// -------------------------------------

// ----- Header ----- //

.card-header
  border-bottom: $b-border
  margin-bottom: $b-whitespace-s
  margin-left: -$b-whitespace
  margin-right: -$b-whitespace
  padding-left: $b-whitespace
  padding-right: $b-whitespace

// Modifiers

.card-header--push
  margin-bottom: $b-whitespace-l
```

In the `card` example above, we've defined a modifier class that affects the `card-header` scaffolding item. Applying the class directly to the element descendent of `card` helps us insert additional whitespace when needed, while also keeping CSS specificity low.

Variables
---------

Variables are a big enough consideration that we dedicate an entire file to keeping them organized. You can find all the information regarding variables in [Config][config].

Images
------

A section about naming images? I know. Let's just get through it.

- `bg-*` for background images
- `logo-*` for logos
- `img-*` for content images
- Sub-folders for larger groups


[config]: /config

[bem-definitions]: http://bem.info/method/definitions
[suit-naming-conventions]: https://github.com/suitcss/suit/blob/master/doc/naming-conventions.md
