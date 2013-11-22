---
title: Foundation - Helpers
---

# Helpers

**Foundation - Helpers** consists of:

1. Extends
2. Functions
3. Mixins
4. Keyframe Animations

## A Note About Sizing

By default, **MVCSS** sizes all elements (`font-size`, `margin`, `padding`) with **ems**. We do this through the `em()` function, that simply divides the target pixel value by the `$context` value passed in, which defaults to the `$base-fontSize` variable. Here's an example:

```sass
h4
  font-size: em(20px)
```

If you were to alter the context from the default `$base-fontSize`, you would need to pass the new context in as the second argument:

```sass
h4
  font-size: em(20px)
  padding-bottom: em(10px, 20px)
```

To make adjustments easier, create a local `$context` variable for the size:

```sass
h4
  $context: 20px
  font-size: em($context)
  padding-bottom: em(10px, $context)
```

If you'd like to use rems, there is an `rem()` function available as well:

```sass
h4
  font-size: rem(20px)
```

**Note**: Be sure to look at your site's browser support to determine if rems are the right option. [Take a look at the current browser support for rem](http://caniuse.com/#feat=rem).

<a class="btn--b" href="/foundation/base/">Next &rarr;</a>
