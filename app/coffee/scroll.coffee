# -*- coding: utf-8 -*-

$(document).ready ->
  $navItems   = $("a[href^='#'], h1")
  duration    = 1500
  mobileWidth = 680
  barHeight   = $("#drawer-wrap").height()
  space       = if $(window).width() > mobileWidth then 0 else barHeight

  $navItems.SmoothScroll
    duration: duration
    easing: "easeOutQuint"
    space: space
  return
