# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).load ->
  $('#spiderpig').raptorize()
    # 'enterOn' : 'konami-code'
    
  spiderpigLabel = $('#spiderpig-label').text()
  callbackPID = null
  spiderpigCallback = ->
    if $('#spiderpig-label').text() == spiderpigLabel 
      $('#spiderpig-label').text('//github.com/bmorrall')
    else
      $('#spiderpig-label').text(spiderpigLabel)
    callbackPID = setTimeout(spiderpigCallback,4000)
    return
  callbackPID = setTimeout(spiderpigCallback,6000)
  $('#spiderpig-label').click ->
    clearTimeout(callbackPID)
    spiderpigCallback()
    return
  return

  