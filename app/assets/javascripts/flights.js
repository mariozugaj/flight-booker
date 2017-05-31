$(document).on('turbolinks:load', function () {
  $('.button-collapse').sideNav();
  $('select').material_select();

  $('.select_flight').on('click', '.collection-item', function (e) {
    $(this).siblings('.collection-item').removeClass('active');
    this.classList.add('active');
    this.querySelector("input[name='flight_id']").checked = 'checked';
  });
});
