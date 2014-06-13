# MVCSS

## About
**MVCSS** [Modular View CSS] is a Sass-based CSS architecture for creating predictable and maintainable application style.

CSS, for all its simplicity, is a difficult language to manage in large-scale implementations. Naming, paths to abstraction, structure, and methodologies are all free-form; MVCSS seeks to provide order for these sorts of projects.

Keeping with the architecture motif, applications are split into three major categories: *Foundation*, *Components*, and *Structures*. If Foundation represents tools, materials, and the ground level, Components are akin to creating a window from those materials, and Structures would be a number of windows and doors creating a wall.

For a very early taste, here’s what a simple Component might consist of:

```sass
// *************************************
//
//   Card
//   -> Base containers
//
// *************************************

.card
  @extend .mbs
  @extend .pas
  border-radius: 5px

// -------------------------------------
//   Modifiers
// -------------------------------------

.card--a
  @extend .bci

.card--b
  @extend .bca

// -------------------------------------
//   Scaffolding
// -------------------------------------

.card-label
  @extend .tcs
  @extend .ttu
  @extend .twb
```

Don’t worry about the odd class names quite yet, we’ll cover the thinking behind those in Foundation.

There’s no shortage of wonderful frameworks, ideas, and methods for tackling CSS across the web, and MVCSS wouldn’t exist without a few of these. Take a look at the Inspiration(link) section to find out more about our architectural roots.

## Styleguide
Before diving in, we’ll start with a bit of housekeeping. This section outlines our internal standards for writing CSS (and more specifically, Sass). While you’re certainly welcome to switch it up, these guidelines will help in moving through our examples and base files.

We’re big proponents of the Sass indented syntax (.sass), so things may look slightly different if you’re a Sassy CSS (.scss) fan.

**Word of warning:** some of the sections herein will be a bit confusing, like Naming Conventions, until seen in context later—an unfortunate chicken/egg situation.

### The Basics
* Alphabetize properties
* Extends and Mixins should be placed before standard properties
* Use soft tabs with a two space indention
* Add a space after `:`
* Add a space after `//` comments
* Add a space after commas in values (e.g. `rgba(#000, 0.5)`)
* Stick with classes instead of IDs for styling
* Limit nesting as much as possible

```sass
// Example

.component
  @extend .bci
  +transition(opacity 0.2s ease-in-out)
  border-radius: 5px
  box-shadow: 0 2px 5px rgba(#000, 0.5)
  font-style: italic
```

### The Numbers Game
As much as possible, we prefer sticking to relative units in a predictable scale. Base values are typically stored in Settings (which we’ll cover in Foundation) and derived from that point on. For purposes of efficiency and standardization, you’ll defining number values less often than usual in MVCSS.

#### Approach
* A pixel value for a base font size (stored in Settings) is set on the root `html` element, thereby preparing both text sizing and the relative value of an em unit
* Line heights are unitless, e.g. `1.5`
* Spacing (padding, margin, etc.) is a multiple of a stored base whitespace value, set in ems
* Font sizes (aside from the `html` element) are defined with percentage values, scaling the other relative properties on the element simultaneously

This setup should be a easier to grasp once we reach the Settings, Utilities, and Base segments of Foundation.

**Note:** pixel values will occasionally be required to meet design requirements, especially with things like offsets. Try to use them as sparingly as possible.

### Comments
There are four levels of comments, in order of decreasing importance:

```sass
// *************************************
//
//   First Level
//   -> Description
//
// *************************************

// -------------------------------------
//   Second Level
// -------------------------------------

// ----- Third Level ----- //

// Fourth Level
```

### Naming Conventions
Following ideas pioneered in [BEM](http://bem.info/method/definitions) and [SUIT](https://github.com/suitcss/suit/blob/master/doc/naming-conventions.md), MVCSS has a strict series of naming conventions that provide context at a glance.

#### Utilities
As you likely noticed in the Component example to kick off MVCSS, many of the extended classes looked pretty acronym-y. We’ll get into the gains inherent with defining utilities shortly, but for now just assume two- or three-letter classes fall under this notion.

A class such as `.mbm` is a shorthand way to define a basic unit of bottom margin: **m**argin **b**ottom **m**edium. Similarly, `.mbl` would be the large variety of bottom margin.

#### Components / Structures
Structures and Components exist as Sass partials in their respective directories, and are always singular. Examples include icon, button, grid, form, and modal.

If the name comprises two words, utilize camelCase—for instance, taskList.

#### Modifiers
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
  padding: 0 1em
  text-weight: bold

// -------------------------------------
//   Modifiers
// -------------------------------------

// ----- Appearance ----- //

.btn--a
  background: $c-base

.btn--b
  background: $c-action

// ----- Size ----- //

.btn--s
  font-size: 75%

.btn--l
  font-size: 150%
```

After creation, elements that need a modifier will use the root class (`.btn`) and any number of modifiers deemed necessary:

```html
<button class="btn btn--a btn--l">A Button</button>
```

**Note:** appearance modifiers typically work best when defined in sequence (`a`, `b`) or via function (`cancel`, `submit`) as opposed to look (`red`, `blue`).

#### States
Generally added via JavaScript, states are similar to modifiers but carry conditional context. `is-` denotes a state, such as `is-active`, and they’re utilized as such:

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
  padding: 0 1em
  text-weight: bold

// -------------------------------------
//   Modifiers
// -------------------------------------

.btn--a
  background: $c-base

.btn--b
  background: $c-action

// -------------------------------------
//   States
// -------------------------------------

.btn.is-active
  background: $c-highlight
```

#### Context
Also borrowed from [SUIT](https://github.com/suitcss/suit/blob/master/doc/naming-conventions.md) is the concept of context. Modularizing styles into self-contained units works well *most* of the time, but you’ll occasionally need a parent element to fall in line.

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

Similar to `is-` with states, `has-` denotes a context selector.

#### Scaffolding
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

For items in scaffolding, the Component/Structure name comes first, followed by a single hyphen and the subcomponent/substructure name (also in camelCase, if necessary). Where applicable, they can have their own modifiers, states, and subcomponents/substructures—more than two levels, though, typically means it’s time to refactor.

#### Variables
Found in Settings, variables differ widely from project to projects. It’s pretty standard to find a few constants, though:

```sass
// -------------------------------------
//   Variables
// -------------------------------------

// ----- Base ----- //

$b-fontSize: 18px
$b-lineHeight: 1.5
$b-whitespace: 1em

// ----- Color ----- //

$c-action: #0000ff
$c-base: #333
$c-invert: #fff

// ----- Font ----- //

$f-base: Georgia, "Times New Roman", serif
$f-mono: "Source Sans Pro", Courier, monospace
```

#### Images
A section about naming images? I know. Let's just get through it.

*   `bg-*` for background images
*   `logo-*` for logos
*   `img-*` for content images
*   Sub-folders for larger groups

## Manifest
Now that we’ve touched on naming and piecemeal ideas, lets put it all together. MVCSS expects the following setup wherever your styles are found:

```sass
application.sass
foundation/
  _reset.sass
  _settings.sass
  _helpers.sass
  _utilities.sass
  _base.sass
components/
structures/
vendor/
```

`application.sass` is used as the manifest and inbox (more on that later). Application as a name is derived from the Rails asset pipeline, and all other files are Sass partials imported in.

Post compile, `application.css` is included on each site page and various settings can be employed for compression.

### Imports
Files found in Foundation are imported into the manifest in a particular order, while Components and Structures are typically included alphabetically:

```sass
// *************************************
//
//   Project Name
//   -> Manifest
//
// *************************************

// -------------------------------------
//   Foundation
// -------------------------------------

@import "foundation/reset"
@import "foundation/settings"
@import "foundation/helpers"
@import "foundation/utilities"
@import "foundation/base"

// -------------------------------------
//   Components
// -------------------------------------

// Component imports

// -------------------------------------
//   Structures
// -------------------------------------

// Structure imports

// -------------------------------------
//   Vendor
// -------------------------------------

// Third-party style imports

// -------------------------------------
//   Inbox
// -------------------------------------
```

### Inbox
Collaboration with developers can sometimes be difficult, but we've found a way to help mitigate that (at least as it relates to CSS). At the bottom of the `application.sass` file, there's a comment block that looks like this:

```sass
// -------------------------------------
//   Inbox
// -------------------------------------
```

You can add any temporary styles to this section, which will allow the maintainer of the CSS to rewrite or sort the styles appropriately. We've found that developers respect, and even enjoy, this system, as they don't have to fuss with any of the existing organization.

## Foundation
As mentioned earlier, the Foundation represents the tools and materials at the ground level. This is the initial setup for your application. The Foundation is made up of:

- Reset
- Settings
- Helpers
- Utilities
- Base

### Reset
As long as the project size warrants it, we always get things started with a style reset. [Normalize.css](http://necolas.github.io/normalize.css/) is what we use (and it is what's included by default), but alternatives like the [Eric Meyer Reset CSS](http://meyerweb.com/eric/tools/css/reset/reset.css) are easily interchangeable.

### Settings
The Settings hold your `@font-face` font setup (if applicable), and all of your application-wide variables. We include a set by default, which is broken down into Base, Colors, and Fonts.

#### @Font-face
If serving font files from a known path (e.g. your server), we include Bourbon's `+font-face` [mixin](https://github.com/thoughtbot/bourbon/blob/master/app/assets/stylesheets/css3/_font-face.scss) that simplifies the daunting syntax and also lists fallback files needed for browser compatibility.

```sass
// -------------------------------------
//   @font-face
// -------------------------------------

// ----- Open Sans ----- //

// +font-face('OpenSans', 'OpenSans')
// +font-face('OpenSans', 'OpenSansBold', bold)
// +font-face('OpenSans', 'OpenSansItalic', normal, italic)
```

When using web fonts from Google Fonts or a similar service, you can paste their generated `@import` link into this section.

```sass
// -------------------------------------
//   @font-face
// -------------------------------------

// ----- Open Sans ----- //

// @import url(http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700)
```

Many other web font providers offer fonts exclusively via a JavaScript snippet. If you're using one of these providers, then you can expect to leave the `@font-face` section empty.

#### Naming Variables
All variables in MVCSS are defined in Config and are prefixed by their role or respective component/structure.

*   `$b-*` for base variables
*   `$c-*` for colors
*   `$f-*` for fonts
*   `$breakpoint-*` for breakpoints
*   `$componentName-*` for components
*   `$structureName-*` for structures

Colors are a somewhat complicated issue, but we've had the most success defining an initial palette and then referencing those colors within other varibles. In projects with a limited set of colors, you may not need a palette section, so we encourage you to choose the approach you prefer.

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

### Helpers
Helpers are the functions, mixins, and animations used throughout an MVCSS application.

#### Common Use Cases
*   Unit conversions
*   Vendor prefix mixins with included fallbacks
*   Shorthands for verbose syntaxes (e.g., media queries)
*   Reusable keyframe animations

***Note:*** Animations unique to specific structures are defined at the bottom of their respective style sheets.

### Tools
Since the last version of MVCSS, we've embraced the idea of presentational class names and have included them as Tools in MVCSS v4. Simply put, Tools are presentational utility classes for usage within HTML itself. They're helpful when you need a specific style in a unique context, but can't justify creating (and naming) a new module or modifier to achieve the desired effect.

```html
<div class="card">
  <p class="mbf">This paragraph element needs its `margin-bottom` flattened, so we're adding a class of `mbf`.</p>
</div>
```

Tools are typically as limited in responsibility as possible, allowing you to mix and match various classes to quickly produce many different styles. Every Tool does one thing and one thing well, ensuring that the elements they affect stay both predictable and extensible.

Some Tools like `group` and `ir` may be more verbose in terms of CSS, but still adhere to the single responsibility principle.

```html
<footer class="group tci tss">
  <p class="fl">&copy; 2014</p>
  <p class="fr">Made with Envy</p>
</footer>
```

If you find yourself using multiple Tools to acheive a reusable group of styles, it may be a sign that you should define those properties in their own module or modifier.

```html
<a class="btn pbm pll prl ptm tsl" href="v3.zip" >Download v3.0.0</a>
<a class="btn pbm pll prl ptm tsl" href="v2.zip" >Download v2.4.1</a>
```

In the example above, we're trying to create a large button by using only Tools. Though it achieves the intended effect, we're much better off defining those common styles in a `.btn--large` class, and then applying it in the markup.

```sass
.btn--large
  font-size: $b-fontSize-l
  padding: $b-whitespce $b-whitespace-l
```

```html
<a class="btn btn--large" href="v3.zip" >Download v3.0.0</a>
<a class="btn btn--large" href="v2.zip" >Download v2.4.1</a>
```

### Base
Base contains all of the tag-level settings for default HTML elements. These are things like anchors, headings, paragraphs, lists, and everything else that doesn't have a class name attached. Because there are so many possible HTML elements to cover, we typically only style the ones relevant to a project as we need them.

We define `html` and `body` styles at the top, and then divide the remaining content into Block and Inline sections.

```sass
// *************************************
//
//   Base
//   -> Tag-level settings
//
// *************************************

html
  background: $c-background
  color: $c-base
  font-family: $f-base
  font-size: $b-fontSize
  line-height: $b-lineHeight

body
  font-size: 100%
```

#### Block Content
Block content is made up of all the block-level elements needed in an MVCSS project. Typically, this section includes the aforementioned headings, paragraphs, lists, as well as figures, blockquotes, and more.

Collapsing margins, while an intentional feature of CSS, only add complexity when authoring style sheets, so we limit vertical margins on block-level elements to a [single-direction](http://csswizardry.com/2012/06/single-direction-margin-declarations/).

```sass
// -------------------------------------
//   Block Content
// -------------------------------------

ul, p
  margin-bottom: $b-whitespace
  margin-top: 0

li
  margin-bottom: $b-whitespace-s
  margin-top: 0

// ----- Headers ----- //

h1, .h1,
h2, .h2,
h3, .h3,
h4, .h4
  font-family: $f-header
  font-weight: bold
  line-height: 1.2
  margin-bottom: $b-whitespace-xs
  margin-top: 0
```

#### Inline Content
Inline content is made up of—you guessed it—inline elements. These include tags like `a`, `strong`, `em`, `code`, and any others that don't force a line break before and after themselves by default.

```sass
// -------------------------------------
//   Inline Content
// -------------------------------------

a
  border-bottom: $b-border
  color: $c-highlight
  text-decoration: none
  &:hover,
  &:focus
    border-bottom-color: $c-highlight
    color: $c-subdue
```

## Components
Taking materials and building a window

Collection of unique properties and utilities

Examples

### Sample
Button
<!-- Bucket/grid might be a better example. -->

## Structures
Components like windows, walls, and doors into a structure

Collection of unique properties, utilities, and components

How to choose over just adding classes - additional unique properties, responsiveness to components

Examples

### Sample
Header

## Vendor
Occasionally (project dependent), you’ll need to utilize more robust libraries or pieces of functionality with styles outside your control. Examples typically include the likes of jQuery UI and CodeMirror, which bundle required CSS that you may not incorporate otherwise. In these situations, Vendor provides a place for third-party styles to live.

## Usage
Common problem areas

### Extending Utilities
Dealing with specificity and extending utilities

<!--
- Remove @extend explanation
- Specificty of tools is slight, so applying them in the markup may not cause intended effect.
  - Code smell
    - Write components and structures to declare fewer default styles
  - Or add !important
-->

### States
Same thing with states

### Avoiding Bedlam
Abstracting well

### Responsiveness
Component or structure?

## Inspiration
We’re always on the lookout for new approaches and better means of abstraction. Here are some great resources and examples for writing better CSS that we’ve worked to incorporate into our thinking.

### Methodologies
* [OOCSS](http://oocss.org)
* [SMACSS](http://smacss.com)
* [BEM](http://bem.info/method)

### Libraries
* [Foundation](http://foundation.zurb.com)
* [Bootstrap](http://getbootstrap.com)
* [SUIT](https://github.com/suitcss/suit)
* [inuit.css](https://github.com/csswizardry/inuit.css)

### Articles
* [Code Smells](http://csswizardry.com/2012/11/code-smells-in-css)
* [Selector Intent](http://csswizardry.com/2012/07/shoot-to-kill-css-selector-intent)
* [Atomic CSS](http://coding.smashingmagazine.com/2013/10/21/challenging-css-best-practices-atomic-approach)
