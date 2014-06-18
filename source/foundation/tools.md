---
title: Foundation - Utilities
---

## Tools

Since the last version of MVCSS, we've embraced the idea of presentational class names, and have included them as Tools in MVCSS v4. Simply put, Tools are presentational utility classes for usage within HTML itself. They're helpful when you need a specific style in a unique context, but can't justify creating (and naming) a new module or modifier to achieve the desired effect.

```html
<div class="card">
  <p class="mbf">This paragraph element needs its `margin-bottom` flattened, so we're adding a class of `mbf`.</p>
</div>
```

### Single Responsibility

Tools are typically as limited in responsibility as possible, allowing you to mix and match various classes to quickly produce many different styles. Every Tool does one thing and one thing well, ensuring that the elements they affect stay both predictable and extensible.

### Going Too Far

If you find yourself using multiple Tools to acheive a reusable group of styles, it may be a sign that you should define those properties in their own module or modifier.

```html
<a class="btn pbm pll prl ptm tsl" href="v3.zip" >Download v3.0.0</a>
<a class="btn pbm pll prl ptm tsl" href="v2.zip" >Download v2.4.1</a>
```

In the example above, we're trying to create a large button by using only Tools. Though it achieves the intended effect, we're much better off defining those common styles in a `.btn--l` class, and then applying it in the markup.

```sass
.btn--l
  font-size: $b-fontSize-l
  padding: $b-whitespace $b-whitespace-l
```

```html
<a class="btn btn--l" href="v3.zip" >Download v3.0.0</a>
<a class="btn btn--l" href="v2.zip" >Download v2.4.1</a>
```
