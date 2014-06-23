---
title: Structures
type: page
priority: 15
---

Structures
==========

Structures are a project's modules and user interface elements that are too specialized for use across multiple sites. In some cases, they might assume a certain context or content type, and in other cases, they might include thematic styles or responsive layout.

When explaining what characterizes a [Component][component] versus a Structure, we outlined a few considerations that help us determine between the two:

- Size of scope
- Dependencies on other modules
- Portability between projects, or lack thereof

Size of Scope
-------------

When a module affects different aspects of an element or arrangement of elements simultaneously (i.e., it has a wide *scope*), that's a very strong indicator that you're dealing with a Structure.

Let's say, for example, you're designing a fairly common site header: logo on the left, plus some horizontal navigation on the right. You could realistically build this pattern using a combination of Helpers, Components, and Tools.

```html
<header class="group">
    <img class="fl" src="logo.svg" alt="Website">
    <nav class="fr">
        <ul class="list list--inline">
            <li class="list-item"><a href="/">Home</a></li>
            <li class="list-item"><a href="/blog">Blog</a></li>
            <li class="list-item"><a href="/contact">Contact</a></li>
        </ul>
    </nav>
</header>
```

But what happens when we try to make our site responsive? On small-screen devices, we want our navigation to also:

- Fill the viewport width
- Stack links atop one another
- Apply an alternating background color to each list item

See the problem? Our module definitely isn't `list-inline` anymore. It now needs its own aesthetics and responsive behavior&mdash;both of which are tailored to their surrounding design. Although we might use this pattern in multiple places on the site, its broad scope makes copying it across different designs unlikely. In this case, our best bet is to create a new Structure, and define our new themed, responsive list module inside.

Dependencies
------------

Unlike Components, Structures can depend on, or even extend, pre-existing Components. This is useful when you want to add theme or behavior to a Component, but keep any unique changes contained within their own module.

In MVCSS, we use our `grid` Component primarily for page layout. We try to keep it simple and assume as little as possible, but there are cases where we want to include similar functionality inside of a more specific module. Float-based grids don't always behave predictably when their items have variable a height, so we've defined a `collection` Structure to add contextual clearfixing.

```sass
.collection

// -------------------------------------
//   Modifiers
// -------------------------------------

.collection--1of3

  .collection-item:nth-child(3n + 1)
    clear: left

// -------------------------------------
//   Scaffolding
// -------------------------------------

// ----- Item ----- //

.collection-item
  margin-bottom: $b-whitespace-l
```

Using both the `grid` Component and the `collection` Structure, we can apply both modules' classes directly in the markup.

```html
<div class="grid collection collection--1of3">
  <div class="collection-item grid-box grid-box--1of3">
    <!-- Content -->
  </div>
  <div class="collection-item grid-box grid-box--1of3">
    <!-- Content -->
  </div>
  <div class="collection-item grid-box grid-box--1of3">
    <!-- Content -->
  </div>
  <div class="collection-item grid-box grid-box--1of3">
    <!-- Content -->
  </div>
</div>
```

But that's a lot of classes to keep track of! Luckily, Sass can help us simplify our markup thanks to its `@extend` directive.

```sass
.collection
  @extend .grid

// -------------------------------------
//   Modifiers
// -------------------------------------

.collection--1of3
  @extend .grid-box--1of3

  .collection-item:nth-child(3n + 1)
    clear: left

// -------------------------------------
//   Scaffolding
// -------------------------------------

// ----- Item ----- //

.collection-item
  @extend .grid-box
  margin-bottom: $b-whitespace-l
```

And now we apply only a *single set* of classes in the markup.

```html
<div class="collection collection--1of3">
  <div class="collection-item">
    <!-- Content -->
  </div>
  <div class="collection-item">
    <!-- Content -->
  </div>
  <div class="collection-item">
    <!-- Content -->
  </div>
  <div class="collection-item">
    <!-- Content -->
  </div>
</div>
```

Portability
-----------

In the end, limiting scope and minimizing dependencies both affect *portability*, which is usually our biggest concern when classifying modules. If you can easily tweak a few lines of CSS inside a module and use it between projects, that means it's reasonably portable, and you have solid grounds for classifying it as a Component. On the other hand, if try to port a module and find yourself rewriting a significant amount of code, then the module is likely better classified as a Structure.


[component]: /components
