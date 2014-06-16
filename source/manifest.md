---
title: Manifest
---

# Manifest

Now that we’ve touched on naming and piecemeal ideas, lets put it all together. MVCSS expects the following setup wherever your styles are found:

```text
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

## Imports

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

## Inbox

Collaboration with developers can sometimes be difficult, but we've found a way to help mitigate that (at least as it relates to CSS). At the bottom of the `application.sass` file, there's a comment block that looks like this:

```sass
// -------------------------------------
//   Inbox
// -------------------------------------
```

You can add any temporary styles to this section, which will allow the maintainer of the CSS to rewrite or sort the styles appropriately. We've found that developers respect, and even enjoy, this system, as they don't have to fuss with any of the existing organization.
