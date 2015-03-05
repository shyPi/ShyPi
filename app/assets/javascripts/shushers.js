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

      //???WXU hide or disable this here. 
  });

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

$(document).on("hidden.bs.modal", function (e) {
    $(e.target).removeData("bs.modal").find(".modal-content").empty();
});
