jQuery ($) ->
  if window.location.hash 
    hash = window.location.hash
    $('.content-section').not(hash).hide()
    $("[data-hash=#{hash}]").addClass('active')
  else
    url = $('.sidebar a:first').attr('href')
    $('.content-section').not(url).hide()
    $("[data-hash=#{url}]").addClass('active')

  $('.sidebar a').click (e) ->
    e.preventDefault()
    url = $(@).attr('href')
    window.location.hash = url

    $('.sidebar a').removeClass('active')
    $('.content-section').hide()

    $(@).addClass('active')
    $(url).show()
