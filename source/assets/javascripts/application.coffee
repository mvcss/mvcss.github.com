Leo = {}

# -------------------------------------
#   Heading Links
# -------------------------------------

Leo.headingLinks = (options) ->
  options.els.each ->
    el = $(@)
    text = Leo.slugify( el.text() )
    el.attr('id', text)
    el.prepend("<a class='anchor' href='##{text}'>#</a>")

# -------------------------------------
#   Read Time
# -------------------------------------

Leo.readTime = (options) ->
  time = Math.ceil(options.text.split(' ').length / options.wordsPerMinute)
  options.element.append("<b>#{time} minute read</b>")

# -------------------------------------
#   Slugify
# -------------------------------------

Leo.slugify = (text) ->
  text.toLowerCase().replace(/\s+/g, '-').replace(/[^\w\-]+/g, '').replace(/\-\-+/g, '-').replace(/^-+/, '').replace(/-+$/, '')

#-------------------------------------
#  Document Ready
#-------------------------------------

jQuery ($) ->

  Leo.headingLinks({
    els: $('h2, h3, h4, h5, h6')
  })

  Leo.readTime({
    wordsPerMinute: 200
    text: $('.content').text()
    element: $('.content h1')
  })

  $('.toggle').on 'click', (e) ->
    e.preventDefault()
    $(@).toggleClass('is-active')
    $('body').toggleClass('is-sidebar-open')
    $('.sidebar').toggleClass('is-open')
