console.log("Order Form only")


$(document).ready(() => {
  $('#one-off').click(() => {
    $('#one-off-form').toggle()
  });
  $('#continuous').click(() => {
    $('#continuous-form').toggle()
  });
});


// const oneOff = document.getElementById('one-off');
// const continuous = document.getElementById('continuous');
// const oneOffForm = document.getElementById('one-off-form');
// const continuousForm = document.getElementById('continuous-form');

// oneOff.addEventListener('click', () => {
//   if(oneOffForm.style.display === 'none'){
//     oneOffForm.style.display = 'inline';
//   } else {
//     oneOffForm.style.display = 'none';
//   }
// });

// continuous.addEventListener('click', () => {
//   if(continuous.style.display === 'none'){
//     continuous.style.display = 'inline';
//   } else {
//     continuous.style.display = 'none';
//   }
// });
