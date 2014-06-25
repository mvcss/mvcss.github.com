---
title: The Numbers Game
type: page
priority: 4
parent: Styleguide
nested: true
---

Styleguide - The Numbers Game
=============================

As much as possible, we prefer sticking to relative units in a predictable scale. Base values are typically stored in Config (which we’ll cover in [Foundation][foundation]) and derived from that point on. For purposes of efficiency and standardization, you’ll define number values less often than usual in MVCSS.

Approach
--------

- A pixel value for a base font size (stored in Config) is set on the root `html` element, thereby preparing both text sizing and the relative value of an em unit
- Line heights are unitless, e.g. `1.5`
- Spacing (padding, margin, etc.) is a multiple of a stored base whitespace value, set in ems
- Font sizes (aside from the `html` element) are defined with percentage values, scaling the other relative properties on the element simultaneously

This setup should be a easier to grasp once we reach the Config, Tools, and Base segments of Foundation.

**Note:** pixel values will occasionally be required to meet design requirements, especially with things like offsets. Most often, these are considered [magic numbers][csswizardry-magic-numbers], and you should avoid using them as much as possible.


[foundation]: /foundation

[csswizardry-magic-numbers]: http://csswizardry.com/2012/11/code-smells-in-css/
