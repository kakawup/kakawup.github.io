$(document).ready(function() {
  var $navItems, barHeight, duration, mobileWidth, space;
  $navItems = $("a[href^='#'], h1");
  duration = 1500;
  mobileWidth = 680;
  barHeight = $("#drawer-wrap").height();
  space = $(window).width() > mobileWidth ? 0 : barHeight;
  $navItems.SmoothScroll({
    duration: duration,
    easing: "easeOutQuint",
    space: space
  });
});
