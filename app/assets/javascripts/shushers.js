// console.log("HELLO KITTY");

function attachSlider(containerEl, valueEl) {
  var soundThreshold = $(containerEl);
  var soundDisplay = $(containerEl + " > div");
  var initialValue = 50; // set default value to "50", out of 1-100
  var handle = null;

  var updateSliderValue = function (event, ui) {
      handle = handle || $(".ui-slider-handle", soundThreshold);
      soundDisplay.text(ui.value || initialValue)
                .css(handle.position());
      $(valueEl).val(ui.value || initialValue);
  };

  soundThreshold.slider({
      min: 1, max: 100,
      slide: updateSliderValue,
      create: updateSliderValue,
      value: initialValue
  });

};

// Document.ready
$(function() {
  // $(document).trigger('load-js-component');

  $('.open-shusher-profile-modal').click(function() {
    $('#myModal').modal('show');
    setTimeout(function() {
      attachSlider(".sound-threshold", "#shusher_sound_threshold");
    }, 1000)
  })
});
