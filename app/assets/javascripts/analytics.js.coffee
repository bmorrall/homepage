class Analytics
  push: (event) ->
    _gaq?.push.apply(_gaq, arguments);

    if @debug
      args = arguments[0]
      (@events ||= []).push args

window.Analytics = new Analytics()
