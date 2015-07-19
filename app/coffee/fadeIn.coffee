# -*- coding: utf-8 -*-

$(document).ready ->
  $fadeInElms = $("#global-header h1, #global-header nav li")
  duration    = 600
  delaySpeed  = 250

  $fadeInElms.each (i, elm)->
    $(this)
      .delay delaySpeed * i
      .css
        display: getDisplayStyle(elm.tagName)
        opacity: "0"
      .animate
        opacity: "1", duration
    return
  return

getDisplayStyle = (tagName) ->
  if tagName == "LI"
    return "inline-block"
  return "block"
