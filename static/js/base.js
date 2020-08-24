$(function() {
  $('#side-icon').click(function() {
    $(this).toggleClass('active')
    if($(this).hasClass('active')) {
      $('#side-content').addClass('active');
      $('#side-close').addClass('active');
    } else {
      $('#side-content').removeClass('active');
      $('#side-close').removeClass('active');
    }
  });
});