---
title: Config
type: page
parent: Foundation
nested: true
---

Foundation - Config
===================

Config holds your `@font-face` font setup (if applicable), and all of your application-wide variables. We include a set by default, which is broken down into Base, Colors, and Fonts.

@Font-face
----------

If serving font files from a known path (e.g. your server), we include Bourbon's `+font-face` [mixin][bourbon-mixin-fontface] to simplify the daunting syntax, and also list fallback files needed for browser compatibility.

```sass
// -------------------------------------
//   @font-face
// -------------------------------------

// ----- Open Sans ----- //

+font-face('OpenSans', 'OpenSans')
+font-face('OpenSans', 'OpenSansBold', bold)
+font-face('OpenSans', 'OpenSansItalic', normal, italic)
```

**Note:** if you use a web font provider that offers fonts exclusively via a JavaScript snippet, you can expect to leave the `@font-face` section empty.

Variables
---------

All variables in MVCSS are defined in Config and are prefixed by their role or respective Component/Structure.

- `$b-*` for base variables
- `$c-*` for colors
- `$g-*` for breakpoints
- `$componentName-*` for Components
- `$structureName-*` for Structures

Colors are a somewhat complicated issue, but we've had the most success defining an initial palette (without color prefixes), and then referencing those colors within other varibles. In projects with a limited set of colors, you may not need a palette section, so we encourage you to choose the approach you prefer.

```sass
// -------------------------------------
//   Colors
// -------------------------------------

// ----- Palette ----- //

$cerulean: #017ba7
$forest: #7ba05b
$gainsboro: #ecf0f1
$gold: #ffd700
$jet: #343434
$scarlet: #ff3f00
$white: #fff

// ----- Base ----- //

$c-background-invert: $white
$c-background: $gainsboro
$c-border: lighten($jet, 30%)
$c-error: $scarlet
$c-highlight: $cerulean
$c-text-invert: $white
$c-text: $jet
$c-subdue: lighten($cerulean, 40%)
$c-success: $forest
$c-warning: $gold

// ----- Components ----- //

// Example: $row--a-background: $c-highlight

// ----- Structures ----- //

// Example: $dropdown-link-color: $c-subdue

// -------------------------------------
//   Base
// -------------------------------------

// ----- Borders & Box Shadow ----- //

$b-borderRadius: 3px
$b-borderStyle: solid
$b-borderWidth: 2px
$b-border: $b-borderWidth $b-borderStyle $c-border
$b-boxShadow: 0 2px 0 rgba($jet, 0.25)

// ----- Typography ----- //

$b-fontFamily-heading: 'OpenSans', sans-serif
$b-fontFamily: 'OpenSans', sans-serif
$b-fontSize: 16px
$b-fontSize-s: 75%
$b-fontSize-m: 90%
$b-fontSize-l: 115%
$b-lineHeight: 1.5

// ----- Sizing ----- //

$b-space: em(20px)
$b-space-s: 0.5 * $b-space
$b-space-l: 2 * $b-space
$b-space-xl: 4 * $b-space

// -------------------------------------
//   Components
// -------------------------------------

// ----- Grid ----- //

$g-s: em(480px)
$g-m: em(800px)
$g-l: em(1024px)

// -------------------------------------
//   Structures
// -------------------------------------

// ----- Dropdown ----- //

// Example: $dropdown-width: em(200px)
```


[bourbon-mixin-fontface]: https://github.com/thoughtbot/bourbon/blob/master/core/bourbon/library/_font-face.scss
