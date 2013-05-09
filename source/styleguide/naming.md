---
title: Styleguide / Naming Conventions
---

## Naming Conventions

### Sass Variables

Variables, as documented in [Core / Settings](/core/settings/), should follow the same naming conventions as your modules, referenced below. The most global variables (used in multiple places, multiple contexts) are prefixed with `$base-`. Let's look at some examples:

- `$base-background: #eee`
- `$base-color: #444`
- `$base-borderRadius: 3px`
- `$base-fontSize: 16px`
- `$base-lineHeight: 1.6`
- `$base-whitespace: 20px`

Content and layout variables are prefixed with `$c-` and `$l-`, respectively.

- `$c-header-color: #999`
- `$c-header-fontFamily: sans-serif`
- `$l-maxWidth: 960px`
- `$l-sidebar-width: 200px`

You may also create module-specific variables, like so:

- `$grid-breakpoint-lap: 480px`
- `$grid-breakpoint-desk: 800px`
- `$grid-gutter: 20px`
- `$form-fontSize: 12px`
- `$form-input-background: #ddd`

### Hierarchy

- **Do not** use `.block--left` or `.block--right`
- **Do** use `.block--a` and `.block--b` to semantically establish hierarchy

### Modules

Modules, sub-modules, module/sub-module modifiers, and module/sub-module states.

```

// ----- Module ----- //

// Examples:
// ------------------
// .module
// .moduleName
// ------------------

// ----- Sub-module ----- //

// Examples:
// ------------------
// .module-sub
// .moduleName-sub
// .moduleName-subName
// ------------------

// ----- Modifiers ----- //

// Examples:
// ------------------
// .module--modifier
// .moduleName--modifier
// .module-sub--modifier
// .moduleName-sub--modifier
// .moduleName-subName--modifer
// ------------------

// ----- State Modifiers ----- //

// Examples:
// ------------------
// .is-module-action
// .is-moduleName-action
// .is-module-sub-action
// .is-moduleName-subName-action
// ------------------

```

### Images

A section about naming images? I know. Let's just get through it.

- `bg-*` for backgrounds
- `icn-*` for icons
- `logo-*` for logos
- `img-*` for generic images
- Sub-folders for larger groups
