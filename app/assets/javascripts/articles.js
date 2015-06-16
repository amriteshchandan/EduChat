$(document).ready(function(){
  setTimeout(function(){
    $('#error_explanation').fadeOut("slow", function() {
      $(this).remove();
    })
  }, 4000);   
});