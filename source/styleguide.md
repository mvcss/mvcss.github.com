---
title: Style Guide
---

# Style Guide

Everyone has a favorite way to write CSS and determine how to name modules. Realizing that everyone includes us, here are our compiled standards for stylesheet authoring and module naming.

## Basics

- Alphabetize properties
- Use soft-tabs with two-space indent
- **Do not** use ids (only classes)
- Put spaces after `:`
- Put spaces after the `//` for comments
- **Do not** put a space between rule declarations

```

// This is an example!
.example
  background: #FFF
  color: #000
  font-size: 1.6em

.example-alt
  background: #000
  color: #FFF
  font-size: 2em

```

## Sass-specific (.sass)

- Follow the same rules listed in the Basics section
- **Do not** nest deeper than 3 levels (with the exception of pseudo/hover states)
- Place mixin(`+`) and `@extend` calls at the top of the properties list

### Comments

There are three levels of comments:

```

//-------------------------------------
//  First Level
//-------------------------------------

// ----- Second Level ----- //

// Third Level

```

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
