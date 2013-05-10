---
title: Styleguide - Naming Conventions
---

## Naming Conventions

### Modules

**Note**: Module files should be named in the singular, unless your module's name is plural. For example:

- `modules/_button.sass`
- `modules/_grid.sass`
- `modules/_form.sass`

Modules are broken down into the base module, submodules, modifiers, and states. If your module or submodule name is two words, use camelCase. For example, `.moduleName`.

### Modifiers

Use `--` for a modifier on a module or submodule. For example:

- `.module--modifier`
- `.module-submodule--modifier`.

**Note**: Module and submodule modifier variables contain the same convention. For example:

```

$module--modifier-background: #000
```

### States

Use the `is-state`, `is-module-state`, `is-module-submodule-state` pattern for your states. For example:

- `.is-active`
- `.is-sidebar-toggled`
- `.is-nav--item-active`

### Sass Variables

Variables, as documented in [Core - Settings](/core/settings/), should follow the same naming conventions as your modules, referenced above. The most global variables (used in multiple places, multiple contexts) are prefixed with `$base-`. Let's look at some examples:

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

### Images

A section about naming images? I know. Let's just get through it.

- `bg-*` for backgrounds
- `icn-*` for icons
- `logo-*` for logos
- `img-*` for generic images
- Sub-folders for larger groups
