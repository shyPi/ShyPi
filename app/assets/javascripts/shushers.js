// console.log("HELLO KITTY");

var mySlider;

// destroy the modal-content every time upon hide, so every show pulls in a new HREF
$(document).on("hidden.bs.modal", function (e) {
  $(e.target).removeData("bs.modal").find(".modal-content").empty();
});

$(document).on("shown.bs.modal", function (e) {
  $('#shusher_sound_threshold').slider({
    tooltip: "never"
  });
  $("#shusher_sound_threshold").on("slide", function(e) {
    var val = $("#slider-value");
    if (e.value < 0) {
      val.text('');
    } else {
      val.text(e.value + '%');
    }
    $('#shusher_sound_threshold').slider('setValue', e.value);
  });
});

$(function() {
  // $('.disable-button').click(function() {
  //   console.log("pretty cat.");
  // });
});
