# About

As front-end devs at [Envy Labs](http://envylabs.com), we work primarily in medium-to-large-sized Rails applications. Each of these projects has a sizable amount of CSS undergoing normal maintenance and iteration. Depending on complexity and setup, changes to existing style can be difficult or done poorly if the right way is too convoluted.

**MVCSS** is our method for creating predictable and maintainable application style.

## What? Another Way to Write CSS?

We're big fans (and often employ tenets of) well-documented methods like [OOCSS](https://github.com/stubbornella/oocss/wiki), [BEM](http://bem.info/method/), and [SMACSS](http://smacss.com/). This bit of architecture and accompanying [Style Guide](http://mvcss.github.io/styleguide/)/[Library](http://mvcss.github.io/library/) meshes all of our preferred practices into one place.

## All This for CSS?

CSS in and of itself is simple to pick up, but difficult to apply maintainably to large applications - hence the popularity of the methods listed above. **MVCSS** is one such manner to organize styles, and the one that we've had the most success in employing.

## Do I Have to Use Sass?

Sass is definitely not required to employ this paradigm, but we're big fans (hence the default project files being in Sass - blame Rails).

## Organizational Overview

**MVCSS** is broken down into two primary sections:

### 1. [Core](/core/)

- [Reset](/core/reset/)
- [Settings](/core/settings/)
- [Helpers](/core/helpers/)
- [Base](/core/base/)
- [Content](/core/content/)
- [Layout](/core/layout/)

### 2. [Modules](/modules/)

- Self-contained, reusable chunks.
