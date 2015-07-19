var getDisplayStyle;

$(document).ready(function() {
  var $fadeInElms, delaySpeed, duration;
  $fadeInElms = $("#global-header h1, #global-header nav li");
  duration = 600;
  delaySpeed = 250;
  $fadeInElms.each(function(i, elm) {
    $(this).delay(delaySpeed * i).css({
      display: getDisplayStyle(elm.tagName),
      opacity: "0"
    }).animate({
      opacity: "1"
    }, duration);
  });
});

getDisplayStyle = function(tagName) {
  if (tagName === "LI") {
    return "inline-block";
  }
  return "block";
};
