---
title: Core
---

# Core

## Reset / Normalize

As long as the project size warrants it, we always get things started with a style reset. [Eric Meyer's Reset CSS](http://meyerweb.com/eric/tools/css/reset/) is still our favorite, but alternatives like [Normalize.css](http://necolas.github.io/normalize.css/) are easily interchangeable.

## Settings

The settings partial centers on reusable utilities - @font-face declarations, variables, mixins, classes to be used with placeholder selectors, and keyframe animations. Grouping everything into one file allows newcomers to the project the means to find out what's available to them quickly.

## Base

This section sets any base-level styles for tags, such as `p` or `h1`, beyond what's included in the reset or nomalize. Text styles set here reflect the most common appearance of that tag in the design.

## Inbox

Adding an inbox section to the bottom of your application file allows developers, and those not actively working on the CSS, to quickly add styles that are easily seen by the maintainer of the file.

## Compass

[Compass](http://compass-style.org/) provides utilities and niceties to make your life easier. We use it, and we recommend that you give it a try. There's even a placeholder comment at the top of the application file that shows you where to put your imports for Compass.
