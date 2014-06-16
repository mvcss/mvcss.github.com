---
title: Foundation - Utilities
---

## Utilities

Since the last version of MVCSS, we've embraced the idea of presentational class names and have included them as Tools in MVCSS v4. Simply put, Tools are presentational utility classes for usage within HTML itself. They're helpful when you need a specific style in a unique context, but can't justify creating (and naming) a new module or modifier to achieve the desired effect.

```html
<div class="card">
  <p class="mbf">This paragraph element needs its `margin-bottom` flattened, so we're adding a class of `mbf`.</p>
</div>
```

Tools are typically as limited in responsibility as possible, allowing you to mix and match various classes to quickly produce many different styles. Every Tool does one thing and one thing well, ensuring that the elements they affect stay both predictable and extensible.

Some Tools like `group` and `ir` may be more verbose in terms of CSS, but still adhere to the single responsibility principle.

```html
<footer class="group tci tss">
  <p class="fl">&copy; 2014</p>
  <p class="fr">Made with Envy</p>
</footer>
```

If you find yourself using multiple Tools to acheive a reusable group of styles, it may be a sign that you should define those properties in their own module or modifier.

```html
<a class="btn pbm pll prl ptm tsl" href="v3.zip" >Download v3.0.0</a>
<a class="btn pbm pll prl ptm tsl" href="v2.zip" >Download v2.4.1</a>
```

In the example above, we're trying to create a large button by using only Tools. Though it achieves the intended effect, we're much better off defining those common styles in a `.btn--large` class, and then applying it in the markup.

```sass
.btn--large
  font-size: $b-fontSize-l
  padding: $b-whitespce $b-whitespace-l
```

```html
<a class="btn btn--large" href="v3.zip" >Download v3.0.0</a>
<a class="btn btn--large" href="v2.zip" >Download v2.4.1</a>
```
