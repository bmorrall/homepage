
if window.screen.height == 568 # iPhone 4"
  # Let the content appear fullscreen for 4" iOS devices (iPhone 5)
  document.querySelector("meta[name=viewport]").content = "width=320.1, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"

# Ensure the content is resized to match the current screen
resizeContent = ->
  navHeight = $('.navbar').height();
  contentHeight = window.innerHeight - navHeight;
  $('#content').height(contentHeight).css('margin-top', navHeight);

$ ->
  resizeContent()
  $(window).resize ->
    resizeContent()
