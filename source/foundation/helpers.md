---
title: Helpers
type: page
priority: 10
parent: Foundation
nested: true
---

Foundation - Helpers
====================

Helpers are the functions, mixins, extends, and animations used throughout an MVCSS application.

Functions
---------

Because of the many useful functions that come pre-installed with Sass, we rarely need to define any of our own. Still, there may be occasions where you need to define some other functions (e.g., `em`, `rem`, `strip-units`). For these cases, we've dedicated the Functions section within Helpers to housing all additional functions.

Mixins
------

We use mixins to reduce the amount of repeated code when authoring style sheets. Usually, this involves simplifying lengthy syntaxes, as well as providing fallbacks and vendor prefixes for unsupported CSS properties.

Take media queries for example: the most commonly used arguments are `screen` and `min-width`, so we made a mixin that includes those values as defaults, unless stated otherwise.

```sass
// ----- Respond-to ----- //
// -> Generates a media query
//
// $val - the breakpoint size
// $query - the type of query ('min-width', 'max-width')
// $media - the media type ('screen', 'print', etc.)
// @content - the generated content within the mixin
//

=respond-to($val, $query: min-width, $media: screen)
  @media #{$media} and ($query: $val)
    @content
```

By now using the `respond-to` mixin throughout a project, you can write less code to achieve the same result.

```sass
// Standard CSS
@media screen and (min-width: $breakpoint-m)

// Sass mixin
+respond-to($breakpoint-m)
```

Extends
-------

Extends are collections of rules to use either directly in the markup or to *extend* within modules. These are generally more verbose than Tools, but still adhere to the single responsibility principle.

Even though we frequently extend these classes within modules, we don't use the percent sign syntax (`%className`) to create placeholder selectors in Sass. By never modifying Extends based on context, you don't need to worry about the potential [selector bloat][csswizardry-extends] associated with extending classes.

### Inside Markup

The `group` class applies multiple rules to a single element, and in the following example, we're using it directly in the markup.

```sass
// ----- Clearfix ----- //

.group::after
  clear: both
  content: ''
  display: table
```

```html
<footer class="group">
    <p class="fl">Made with Envy</p>
    <img class="fr" src="logo-envy.svg" alt="Envy Logo">
</footer>
```

### Inside Modules

In the following `grid` Component, we extend the `group` class within the module itself.

```sass
.grid
  @extend .group
  display: block
  margin-left: -$grid-gutter / 2
  margin-right: -$grid-gutter / 2
```

Animations
----------

Within Helpers, Animations are the general-use `@keyframes` definitions that can be called across various modules.

If you catch yourself defining a similar animation in two separate places, we try to abstract it into a single, less contextual animation that can be reused throughout a project.

For example, in the case of `fadeIn`, we're likely to use this animation across many different modules, making it a perfect animation to define inside Helpers.

```sass
// ----- Fade In ----- //

@keyframes fadeIn
  0%
    opacity: 0
  100%
    opacity: 1
```

***Note:*** Animations unique to specific modules are defined at the bottom of their respective style sheets.

[csswizardry-extends]: http://csswizardry.com/2014/01/extending-silent-classes-in-sass/
