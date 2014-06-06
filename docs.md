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

#### Font-face Declarations
<!--
- Font-face declarations
  - Mixin when serving fonts from a known path
  - @import when using Google Fonts, etc.
-->

#### Base
<!--
- Not to be confused with `_base.sass`
- Base variables
  - Namespaced with `$b-` by convention
-->

#### Colors
Color variables

<!--
- Namespaced with `$c-` by convention
- Palette variables
  - Avoid using common color names to reduce confusion with CSS color value keywords
- Semantic variables reference palette variables
-->

#### Fonts
<!--
- Font variables
  - Namespaced with `$f-` by convention
-->

#### Components and Structures
<!--
- All variables throughout the application are declared in config.sass, including those used exclusively by components and strucutures.
- Component and Structure variables
  - Namespaced with module name by convention
-->

### Helpers
<!--
- Functions
  -
- Mixins
  - Font-face mixin
  - Respond-to mixin
  - Vendor prefixes
- Animations
  - Vendor prefixed?
  - Common, reusable UI animations that aren't specific content or component
-->

### Tools
Benchmark properties for ease of use / lack of repetition

<!--
- Utility classes to use directly in markup
- Affect
  - Clearfix groups
  - Image replacement
  - Margins
  - Padding
  - Border Radii
  - Text size
  - Etc.
- Useful when a style is needed on a generic element
  - Ease of use
  - Allieviates the need to name every potential "module"
-->

### Base
Tag-level settings

<!--
-
- Remove margin-top values from block content (as needed in project)
- Include defualt style and pseudo-class style for `<a>` elements
-->

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
