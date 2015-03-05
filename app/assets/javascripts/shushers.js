// console.log("HELLO KITTY");

var mySlider;

function attachSlider(containerEl, valueEl) {
  var soundThreshold = $(containerEl);
  var soundDisplay = $(containerEl + " > div");
  var initialValue = $(valueEl).val() || 50; // set default value to "50", out of 1-100
  var handle = null;

  var updateSliderValue = function (event, ui) {
      handle = handle || $(".ui-slider-handle", soundThreshold);
      soundDisplay.text(ui.value || initialValue)
                .css(handle.position());
      $(valueEl).val(ui.value || initialValue);
  };

  mySlider = soundThreshold.slider({
      min: 1, max: 100,
      slide: updateSliderValue,
      create: updateSliderValue,
      value: initialValue
  });

  // //???WXU hide or disable this here.
  // if (initialValue === -1) {
  //   mySlider = soundThreshold.slider({
  //       min: 1, max: 100,
  //       slide: updateSliderValue,
  //       create: updateSliderValue,
  //       value: initialValue,
  //       disabled: true
  //   });
  // } else {
  //   mySlider = soundThreshold.slider({
  //       min: 1, max: 100,
  //       slide: updateSliderValue,
  //       create: updateSliderValue,
  //       value: initialValue
  //   });
  // }

  // return(mySlider);

};

// Document.ready
// $(function() {
//   $(document).trigger('load-js-component');

//   $('.open-shusher-profile-modal').click(function() {
//     console.log("DOGS!");
//     $('#basicModal').modal('show');
//     setTimeout(function() {
//        attachSlider(".sound-threshold", "#shusher_sound_threshold");
//     }, 1000);
//   })
// });

// destroy the modal-content every time upon hide, so every show pulls in a new HREF
$(document).on("hidden.bs.modal", function (e) {
  $(e.target).removeData("bs.modal").find(".modal-content").empty();
});

$(document).on("shown.bs.modal", function (e) {
  // console.log("hello kitty");
  // $(".disable-button").click( function() {
  //   $(this).toggleClass("btn-primary");
  // });
});

$(function() {
  // $('.disable-button').click(function() {
  //   console.log("pretty cat.");
  // });
});
