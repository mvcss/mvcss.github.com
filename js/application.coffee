jQuery ($) ->
  if window.location.hash 
    hash = window.location.hash
  else
    hash = $('.sidebar a').first().attr('href')
  $('.content-section').not(hash).hide()
  $("[data-hash=#{hash}]").addClass('active')

  $('.sidebar a').click (e) ->
    e.preventDefault()
    hash = $(@).attr('href')
    window.location.hash = hash

    $('.sidebar a').removeClass('active')
    $('.content-section').hide()

    $(@).addClass('active')
    $(hash).show()
