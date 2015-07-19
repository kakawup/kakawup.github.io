var mobileWidth, reMoveBar, showBar, windowWidth;

windowWidth = $(window).width();

mobileWidth = 680;

$(document).ready(function() {
  $(window).scroll(function() {
    var $targetElm;
    $targetElm = windowWidth > mobileWidth ? $("#global-header h1") : $("#drawer-wrap");
    showBar($targetElm.height());
  });
  window.onresize = reMoveBar;
  reMoveBar();
});

showBar = function(scrollPoint) {
  var $showElm, duration, windowTop;
  $showElm = $("#drawer-wrap");
  windowTop = $(this).scrollTop();
  duration = 600;
  if (windowTop > scrollPoint) {
    $showElm.slideDown(duration);
  } else {
    $showElm.slideUp(duration);
  }
};

reMoveBar = function() {
  var maxWidth, navMargin;
  navMargin = 30;
  maxWidth = 960;
  if (windowWidth > maxWidth) {
    return $("#drawer-wrap").css("left", (windowWidth - maxWidth) / 2 + navMargin);
  } else if (windowWidth > mobileWidth) {
    return $("#drawer-wrap").css("left", navMargin);
  }
};
