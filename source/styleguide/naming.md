---
title: Styleguide / Naming
---

## Naming Conventions

### Sass Variables

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
