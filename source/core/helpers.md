---
title: Core - Helpers
---

# Helpers

**Core - Helpers** consists of:

1. Extends
2. Functions
3. Mixins
4. Keyframe Animations

## A Note About Sizing

By default, **MVCSS** sizes all elements (`font-size`, `margin`, `padding`) with [rems](http://snook.ca/archives/html_and_css/font-size-with-rem). We do this through the `rem()` function, that simply divides the target pixel value by the `$base-fontSize`. Here's an example:

```sass
h4
  font-size: rem(20px)
```

**Note**: Be sure to look at your site's browser support to determine if rems are the right option. [Take a look at the current browser support for rem](http://caniuse.com/#feat=rem).

If you'd like to use ems, there is an `em()` function available as well:

```sass
h4
  font-size: em(20px)
```

However, with ems, if you were to alter the context from the default `$base-fontSize`, you would need to pass the new context in as the second argument:

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

<a class="btn--b" href="/core/base/">Next &rarr;</a>
