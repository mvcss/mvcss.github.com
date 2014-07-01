---
title: Tools
type: page
priority: 13
parent: Foundation
nested: true
---

Foundation - Tools
==================

Tools are presentational utility classes for usage directly in the markup itself. They're helpful when you need a specific style in a unique context, but can't justify creating (and naming) a new module or modifier to achieve the desired effect.

For example, the paragraph element inside of the following `card` Component needs its `margin-bottom` made flush, so we can easily apply a Tool class of `mbf`.

```html
<div class="card">
  <p class="mbf">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam non dolor eligendi placeat.</p>
</div>
```

Using a Tool in this situation helps us avoid declaring a `card` or `card` modifier that assumes too much about its use case, while also helping to keep CSS specificity flat and managable.

Single Responsibility
---------------------

Tools are as limited in responsibility as possible, allowing you to mix and match various classes to quickly produce many different styles. Every Tool does one thing and one thing well, ensuring that the elements they affect stay both predictable and extensible.

Going Too Far
-------------

If you find yourself using multiple Tools to achieve a reusable group of styles, it may be a sign that you should define those properties in their own module or modifier.

```html
<a class="btn pbm pll prl ptm tsl" href="v3.zip" >Download v3.0.0</a>
<a class="btn pbm pll prl ptm tsl" href="v2.zip" >Download v2.4.1</a>
```

In the example above, we're trying to create a large button by using only Tools. While our approach achieves the intended effect, we're much better off defining those common styles in a `.btn--l` class, and then applying it in the markup.

```sass
.btn--l
  font-size: $b-fontSize-l
  padding: $b-space $b-space-l
```

```html
<a class="btn btn--l" href="v3.zip" >Download v3.0.0</a>
<a class="btn btn--l" href="v2.zip" >Download v2.4.1</a>
```

This second approach also gives us a styling hook for any future changes to `btn--l`. Tools provide a powerful set of classes for fine-tuning unique contextual styles, but they aren't a replacement for modular CSS practices.
