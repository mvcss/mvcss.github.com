jQuery ($) ->
  if window.location.hash 
    hash = window.location.hash
    $('.content-section').not(hash).hide()
    $("[data-hash=#{hash}]").addClass('active')
  else
    window.location.hash = $('.sidebar a:first').attr('href')
    $('.content-section').not(window.location.hash).hide()

  $('.sidebar a').click (e) ->
    e.preventDefault()
    url = $(@).attr('href')
    window.location.hash = url

    $('.sidebar a').removeClass('active')
    $('.content-section').hide()

    $(@).addClass('active')
    $(url).show()
