---
title: Foundation - Settings
---

[bourbon-mixin-fontface]: https://github.com/thoughtbot/bourbon/blob/master/app/assets/stylesheets/css3/_font-face.scss

## Config

Config holds your `@font-face` font setup (if applicable), and all of your application-wide variables. We include a set by default, which is broken down into Base, Colors, and Fonts.

### @Font-face

If serving font files from a known path (e.g. your server), we include Bourbon's `+font-face` [mixin][bourbon-mixin-fontface] to simply the daunting syntax, and also lists fallback files needed for browser compatibility.

```sass
// -------------------------------------
//   @font-face
// -------------------------------------

// ----- Open Sans ----- //

// +font-face('OpenSans', 'OpenSans')
// +font-face('OpenSans', 'OpenSansBold', bold)
// +font-face('OpenSans', 'OpenSansItalic', normal, italic)
```

When using web fonts from Google Fonts, or a similar service, you can paste their generated `@import` link into this section.

```sass
// -------------------------------------
//   @font-face
// -------------------------------------

// ----- Open Sans ----- //

// @import url(http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700)
```

Many other web font providers offer fonts exclusively via a JavaScript snippet. If you're using one of these providers, then you can expect to leave the `@font-face` section empty.

### Variables

All variables in MVCSS are defined in Config and are prefixed by their role or respective Component/Structure.

*   `$b-*` for base variables
*   `$c-*` for colors
*   `$f-*` for fonts
*   `$breakpoint-*` for breakpoints
*   `$componentName-*` for Components
*   `$structureName-*` for Structures

Colors are a somewhat complicated issue, but we've had the most success defining an initial palette, and then referencing those colors within other varibles. In projects with a limited set of colors, you may not need a palette section, so we encourage you to choose the approach you prefer.

```sass
// -------------------------------------
//   Variables
// -------------------------------------

// ----- Palette ----- //

// Blue

$cerulean: #017ba7

// Green

$forest: #7ba05b

// Grey

$jet: #343434
$gainsboro: #ecf0f1

// Red

$scarlet: #ff3f00

// Yellow

$gold: #ffd700

// White

$white: #fff

// ----- Base ----- //

$b-borderColor: lighten($jet, 30%)
$b-borderStyle: solid
$b-borderWidth: 2px
$b-border: $b-borderWidth $b-borderStyle $b-borderColor
$b-borderRadius: 3px
$b-boxShadow: 0 2px 0 rgba($jet, 0.25)
$b-fontSize: 16px
$b-fontSize-xs: 60%
$b-fontSize-s: 75%
$b-fontSize-m: 90%
$b-fontSize-l: 115%
$b-fontSize-xl: 150%
$b-lineHeight: 1.5
$b-maxWidth: 62.5em // ~1000px
$b-maxWidth-s: 43.75em // ~700px
$b-whitespace: 1.25em // ~20px
$b-whitespace-xs: 0.25 * $b-whitespace
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

// ----- Fonts ----- //

$f-base: 'OpenSans', sans-serif
$f-header: 'OpenSans', sans-serif

// ----- Breakpoints ----- //

$breakpoint-s: 30em // ~480px
$breakpoint-m: 43.75em // ~768px
$breakpoint-l: 64em // ~1024px

// ----- Grid ----- //

$grid-columns: 12
$grid-defaults: "s" $breakpoint-s, "m" $breakpoint-m, "l" $breakpoint-l
$grid-gutter: 20px
$grid-silent: false
```
