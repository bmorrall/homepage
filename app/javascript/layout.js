import $ from 'jquery'

if (window.screen.height === 568) { // iPhone 4"
  // Let the content appear fullscreen for 4" iOS devices (iPhone 5)
  document.querySelector('meta[name=viewport]').content = 'width=320.1, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
}

// Ensure the content is resized to match the current screen
const resizeContent = function () {
  const navHeight = $('.navbar').height()
  const contentHeight = window.innerHeight - navHeight
  return $('#content').height(contentHeight).css('margin-top', navHeight)
}

$(function () {
  resizeContent()
  return $(window).resize(() => resizeContent())
})
