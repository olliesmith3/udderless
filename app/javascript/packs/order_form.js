
$(document).ready(() => {
  $('#one-off').click(() => {
    $('#one-off-form').show();
    $('#continuous-form').hide()
  });
  $('#continuous').click(() => {
    $('#continuous-form').show();
    $('#one-off-form').hide()
  });
});

