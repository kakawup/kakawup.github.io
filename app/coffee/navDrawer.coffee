# -*- coding: utf-8 -*-

$(document).ready ->
  windowWidth = $(window).width()
  mobileWidth = 680

  if windowWidth <= mobileWidth
    $navClose  = $("#drawer-icon, #drawer-shade, #drawer-wrap nav a")
    $navBody   = $("#drawer-wrap nav")
    $navShadow = $("#drawer-shade")
    duration   = 200

    $navClose.click ->
      $navBody.animate
        width: "toggle", duration
      $navShadow.fadeToggle duration
      return
  return
