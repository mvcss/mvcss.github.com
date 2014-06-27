---
title: Config
type: page
priority: 11
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

*   `$b-*` for base variables
*   `$c-*` for colors
*   `$f-*` for fonts
*   `$g-*` for breakpoints
*   `$componentName-*` for Components
*   `$structureName-*` for Structures

Colors are a somewhat complicated issue, but we've had the most success defining an initial palette, and then referencing those colors within other varibles. In projects with a limited set of colors, you may not need a palette section, so we encourage you to choose the approach you prefer.

```sass
// -------------------------------------
//   Variables
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

// Borders & Box Shadow

$b-borderColor: lighten($jet, 30%)
$b-borderRadius: 3px
$b-borderStyle: solid
$b-borderWidth: 2px
$b-border: $b-borderWidth $b-borderStyle $b-borderColor
$b-boxShadow: 0 2px 0 rgba($jet, 0.25)

// Typography

$b-fontFamily-heading: 'OpenSans', sans-serif
$b-fontFamily: 'OpenSans', sans-serif
$b-fontSize: 16px
$b-fontSize-s: 75%
$b-fontSize-m: 90%
$b-fontSize-l: 115%
$b-lineHeight: 1.5

// Spacing

$b-whitespace: 1.25em // ~20px
$b-whitespace-s: 0.5 * $b-whitespace
$b-whitespace-l: 2 * $b-whitespace
$b-whitespace-xl: 4 * $b-whitespace

// ----- Colors ----- //

$c-background: $gainsboro
$c-base: $jet
$c-error: $scarlet
$c-highlight: $cerulean
$c-invert: $white
$c-subdue: lighten($cerulean, 40%)
$c-success: $forest
$c-warning: $gold

// ----- Breakpoints ----- //

$g-s: 30em // ~480px
$g-m: 43.75em // ~768px
$g-l: 64em // ~1024px

// ----- Grid ----- //

$grid-columns: 12
$grid-defaults: "s" $g-s, "m" $g-m, "l" $g-l
$grid-gutter: 20px
$grid-silent: false
```

<!-- Nicktique: if we switch $breakpoint-n or $g-n or whatever to a map, we could avoid needing $grid-defaults -->

[bourbon-mixin-fontface]: https://github.com/thoughtbot/bourbon/blob/master/app/assets/stylesheets/css3/_font-face.scss

