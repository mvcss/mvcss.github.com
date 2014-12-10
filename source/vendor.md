---
title: Vendor
type: page
---

Vendor
======

Vendor is where we include all third-party style sheets and is intentionally empty by default.

Vendor may contain unaltered third-party code, as well as refactored modules from other libraries, frameworks, and UI toolkits. To include any `.css` files, you can change their file extentions to `.scss` and use `@import` as you would normally.

If a snippet of code is portable and no larger than a single class, we usually paste these alongside others modules in the [Helpers][helpers] section.

**Note:** although `_reset.sass` contains third-party code, we include it inside Foundation. This helps us organize low-level styles and prevent some potential source order dependency issues when authoring CSS.


[helpers]: /foundation/helpers/
