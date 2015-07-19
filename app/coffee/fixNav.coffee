# -*- coding: utf-8 -*-

windowWidth = $(window).width()
mobileWidth = 680

$(document).ready ->
  $(window).scroll ->
    $targetElm = if windowWidth > mobileWidth then $("#global-header h1") else $("#drawer-wrap")
    showBar($targetElm.height())
    return

  window.onresize = reMoveBar
  reMoveBar()

  return

showBar = (scrollPoint) ->
  $showElm  = $("#drawer-wrap")
  windowTop = $(this).scrollTop()
  duration  = 600

  if windowTop > scrollPoint
    $showElm.slideDown duration
  else
    $showElm.slideUp duration
  return

reMoveBar = ->
  navMargin = 30
  maxWidth  = 960

  if windowWidth > maxWidth
    $("#drawer-wrap").css "left", (windowWidth - maxWidth) / 2 + navMargin
  else if windowWidth > mobileWidth
    $("#drawer-wrap").css "left", navMargin
