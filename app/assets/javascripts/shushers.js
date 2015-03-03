// console.log("HELLO KITTY");

$(function() {
  var ageInput = $("#ageInput");
  var ageDisplay = $("#ageInput > div");
  var initialValue = 80;
  var handle = null;

  var updateSliderValue = function (event, ui) {
      handle = handle || $(".ui-slider-handle", ageInput);
      ageDisplay.text(ui.value || initialValue)
                .css(handle.position());
      $("#shusher_sound_threshold").val(ui.value || initialValue);
  };

  ageInput.slider({
      min: 1, max: 100,
      slide: updateSliderValue,
      create: updateSliderValue,
      value: initialValue
  });

});